//
//  EthereumWalletManager.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt
import web3
import Combine

enum BalanceErrorCallback : Error {
    case unvalidBalance
}

final class InfuraRPCProvider : InfuraRPCProviderProtocol{
    
    var network : Network
    private var networkProvider : EthereumNetworkProviderProtocol
        
    init(network : Network){
        self.network = network
        let url = URL(string: "https://\(network.connectionName).infura.io/v3/52c2335b85164899816370c58ae0e2fd")!
        self.networkProvider = EthereumNetworkProvider(url: url)
    }
    
    
    func call(to toAddress: String,data : String,block : Block = .latest) -> AnyPublisher<String, EthereumNetworkError> {
        let params = EthCallRequest(to: toAddress, data: data ,block: block.rawValue)
        return networkProvider.makeRequest(method: .call, params: params, receive: String.self)
    }
    
    func getBalance(for address: String) -> AnyPublisher<BigUInt, EthereumNetworkError> {
        let params = GetBalance(from: address,block: Block.latest.rawValue)
            return networkProvider.makeRequest(method: .getBalance, params: params, receive: String.self)
            .receive(on: DispatchQueue.main)
            .tryMap { balanceHexString -> BigUInt in
                guard let balance = BigUInt(hex:balanceHexString) else {
                    throw EthereumNetworkError.decodingError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid balance format"]))
                }
                return balance
            }
            .mapError { error in
                if let ethError = error as? EthereumNetworkError {
                    return ethError
                } else {
                    return EthereumNetworkError.networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
//    func getTransactionCount(from walletAddress: String, block : Block = .latest) async throws -> Int {
//        do{
//            let params = GetTransactionCountRequest(from: walletAddress, block: block.rawValue)
//            let result = try await networkProvider.makeRequest(method: .getTransactionCount, params: params,receive: String.self)
//            if let count = Int(hex: result) {
//                return count
//            }else{
//                throw EthereumClientError.unexpectedReturnValue
//            }
//        }
//        catch (let error){
//            throw failureHandler(error)
//        }
//    }
//    
//    func gasPrice() async throws -> BigUInt {
//        do {
//            let emptyParams: [Bool] = []
//            let result = try await networkProvider.makeRequest(method: .gasPrice, params: emptyParams ,receive: String.self)
//            if let bigUInt = BigUInt(hex: result) {
//                return bigUInt
//            } else {
//                throw EthereumClientError.unexpectedReturnValue
//            }
//        } catch (let error) {
//            throw failureHandler(error)
//        }
//    }
//    
//    func estimateGas(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> BigUInt {
//        do {
//            print(value, value.web3.hexString)
//            let params = EstimateGasRequest(to: toAddress, from: fromAddress, value: value.web3.hexString)
//            let result = try await networkProvider.makeRequest(method: .estimateGas, params: params,receive: String.self)
//            if let gas = BigUInt(hex: result) {
//                return gas
//            } else {
//                throw EthereumClientError.unexpectedReturnValue
//            }
//        } catch (let error) {
//            throw failureHandler(error)
//        }
//    }
//    
//    
//    func sendRawTransaction(to toAddress: String , value: BigUInt? = nil, data : Data? = nil, chain : Chain) async throws -> String {
//        do {
//            guard let ethAccount = try? EthereumAccount(keyStorage: EthereumSingleKeyStorage())
//            else { throw EthereumClientError.notFoundAccount }
//            
//            let fromAddress = ethAccount.address.asString()
//            
//            guard let estimateGas = try? await estimateGas(from: fromAddress, to: toAddress, value: value ?? .zero)
//            else { throw EthereumClientError.notFoundGasEstimate }
//            
//            guard let gasPrice = try? await gasPrice()
//            else { throw EthereumClientError.notFoundGasPrice}
//            
//            guard let nonce = try? await getTransactionCount(from: myAddress)
//            else { throw EthereumClientError.notFoundNonce}
//           
//            let transaction = EthereumTransaction(
//                from: ethAccount.address,
//                to: EthereumAddress(toAddress),
//                value: value,
//                data: data,
//                nonce: nonce,
//                gasPrice: gasPrice,
//                gasLimit: estimateGas,
//                chainId: chain.rawValue
//            )
//            
//            let signedTransaction = try ethAccount.sign(transaction: transaction)
//            let hexSignedTransaction = convertDataToHexString(signedTransaction.raw!)
//            let result = try await networkProvider.makeRequest(method: .sendRawTransaction, params: [hexSignedTransaction],receive: String.self)
//            return result
//        } catch (let error) {
//            throw failureHandler(error)
//        }
//    }
//
}

extension InfuraRPCProvider {
    
    private func convertDataToHexString(_ data: Data) -> String {
        return "0x" + data.map { String(format: "%02x", $0) }.joined()
    }
    
    func failureHandler(_ error: Error) -> EthereumClientError {
        return EthereumClientError.executionError(error.localizedDescription.description)
    }
    
}
