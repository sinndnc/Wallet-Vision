//
//  EthereumWalletRepository.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import BigInt

final class EthereumProviderRepository : EthereumProviderRepositoryProtocol{
        
    @Inject private var ethereumProvider : EthereumRPCProviderProtocol
    @Inject private var etherscanProvider : EtherscanNetworkProviderProtocol
    
    
    func fetchTransactions(for address: String) async throws {
        do {
            let transaction = try await etherscanProvider.fetchTransactions(for: address)
            
            print(transaction)
        } catch (let error) {
            print(error)
        }
        
    }

    func sendRawTransaction(from fromAddress: String, to toAddress: String, value: BigUInt) async throws {
        do {
            let transfer = await try ethereumProvider.sendRawTransaction(from: fromAddress, to: toAddress, value: value)
            
            print(transfer)
        } catch (let error) {
            print(error)
        }
    }
    
        
    func getWalletBalance(of walletAddress : String) async throws -> [Token] {
        do{
            for token in Tokens.list {
                if let contractAddress = token.contractAddress{
                    let balance = try await ethereumProvider.getBalance(of: contractAddress, from: walletAddress)
                    DispatchQueue.main.async {
                        token.balance = balance
                    }
                }else{
                    let balance = try await ethereumProvider.getBalance(from: walletAddress,block: .latest)
                    DispatchQueue.main.async {
                        token.balance = balance
                    }
                }
            }
            return Tokens.list
        }
        catch (let error){
            print(error)
            throw failureHandler(error)
        }
    }
    
    func failureHandler(_ error: Error) -> EthereumClientError {
        return EthereumClientError.executionError(error.localizedDescription)
    }
}
