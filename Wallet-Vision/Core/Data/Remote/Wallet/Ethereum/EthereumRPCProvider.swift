//
//  EthereumWalletManager.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt
import web3

enum BalanceErrorCallback : Error {
    case unvalidBalance
}

final class EthereumRPCProvider : EthereumRPCProviderProtocol{
    
    private var myAddress : String
    private var networkProvider : EthereumNetworkProviderProtocol
    
    init(){
        myAddress = "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf"
        let url = URL(string: "https://mainnet.infura.io/v3/52c2335b85164899816370c58ae0e2fd")!
        self.networkProvider = EthereumNetworkProvider(url: url)
    }
    
    func getTransactionCount(from walletAddress: String, block : Block = .latest) async throws -> Int {
        do{
            let params = GetTransactionCountRequest(from: walletAddress, block: block.rawValue)
            let result = try await networkProvider.makeRequest(method: .getTransactionCount, params: params,receive: String.self)
            if let count = Int(hex: result) {
                return count
            }else{
                throw EthereumClientError.unexpectedReturnValue
            }
        }
        catch (let error){
            throw failureHandler(error)
        }
    }
    
    func gasPrice() async throws -> BigUInt {
        do {
            let emptyParams: [Bool] = []
            let result = try await networkProvider.makeRequest(method: .gasPrice, params: emptyParams ,receive: String.self)
            if let bigUInt = BigUInt(hex: result) {
                return bigUInt
            } else {
                throw EthereumClientError.unexpectedReturnValue
            }
        } catch (let error) {
            throw failureHandler(error)
        }
    }
    
    func estimateGas(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> BigUInt {
        do {
            let params = EstimateGasRequest(to: toAddress, from: fromAddress, value: value.web3.hexString)
            let result = try await networkProvider.makeRequest(method: .estimateGas, params: params,receive: String.self)
            if let gas = BigUInt(hex: result) {
                return gas
            } else {
                throw EthereumClientError.unexpectedReturnValue
            }
        } catch (let error) {
            throw failureHandler(error)
        }
    }
    
    
    func sendRawTransaction(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> String {
        do {
            guard let ethAccount = try? EthereumAccount(keyStorage: EthereumSingleKeyStorage())
            else { throw EthereumClientError.notFoundAccount }
            
            guard let estimateGas = try? await estimateGas(from: fromAddress, to: toAddress, value: value)
            else { throw EthereumClientError.notFoundGasEstimate }
        
            guard let gasPrice = try? await gasPrice()
            else { throw EthereumClientError.notFoundGasPrice}
            
            guard let nonce = try? await getTransactionCount(from: myAddress)
            else { throw EthereumClientError.notFoundNonce}
           
            let transaction = EthereumTransaction(
                from: EthereumAddress(fromAddress),
                to: EthereumAddress(toAddress),
                value: value,
                data: Data(),
                nonce: nonce,
                gasPrice: gasPrice,
                gasLimit: estimateGas,
                chainId: Chain.sepolia.rawValue
            )
            
            let signedTransaction = try ethAccount.sign(transaction: transaction)
            let hexSignedTransaction = convertDataToHexString(signedTransaction.raw!)
            let result = try await networkProvider.makeRequest(method: .sendRawTransaction, params: [hexSignedTransaction],receive: String.self)
            return result
        } catch (let error) {
            throw failureHandler(error)
        }
    }
    
    //TODO: düzelt
    func call(to toAddress: String,data : String,block : Block = .latest) async throws -> String {
        do{
            let params = EthCallRequest(to: toAddress, data: data ,block: block.rawValue)
            let result = try await networkProvider.makeRequest(method: .call, params: params , receive: String.self)
            
            return result
        }catch(let error){
            throw failureHandler(error)
        }
    }
    
    func getBalance(of contractAddress: String,from walletAddress : String) async throws -> BigUInt {
        do{
            let balanceOf = "0x70a08231"
            let paddedAddress =  walletAddress.toPaddedAddress()
            let contractData = balanceOf + paddedAddress
            
            let result = try await call(to: contractAddress, data: contractData)
            
            if let balanceInt = BigUInt(hex: result.web3.noHexPrefix){
                return balanceInt
            }else{
                throw EthereumClientError.decodedError
            }
        }catch(let error){
            throw failureHandler(error)
        }
    }
    
    func getBalance(from walletAddress : String, block : Block = .latest) async throws -> BigUInt {
        do{
            let params = GetBalance(from: walletAddress, block: block.rawValue)
            let result = try await networkProvider.makeRequest(method: .getBalance, params: params,receive: String.self )
            
            if let balanceInt = BigUInt(hex: result.web3.noHexPrefix){
                return balanceInt
            }else{
                throw EthereumClientError.decodedError
            }
        }
        catch(let error){
            throw failureHandler(error)
        }
    }
    
}

fileprivate extension String {
    
    func toPaddedAddress() -> String {
        let trimmedString = self.lowercased().dropFirst(2)
        let paddingCount = max(0, 64 - trimmedString.count)
        let paddedString = String(repeating: "0", count: paddingCount) + trimmedString
        return paddedString
    }
}

extension EthereumRPCProvider {
    
    private func convertDataToHexString(_ data: Data) -> String {
        return "0x" + data.map { String(format: "%02x", $0) }.joined()
    }
    
    func failureHandler(_ error: Error) -> EthereumClientError {
        return EthereumClientError.executionError(error.localizedDescription.description)
    }
    
}
