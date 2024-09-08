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

final class EthereumService : EthereumServiceProtocol{
    
    private var web3 : EthereumHttpClient
    
    init(){
        let infuraURL = URL(string: "https://mainnet.infura.io/v3/52c2335b85164899816370c58ae0e2fd")!
        web3 = EthereumHttpClient(url: infuraURL, network: .sepolia)
    }
    
    func getETHBalance(walletAddress : String) async -> Result<BigUInt,BalanceErrorCallback> {
        do{
            let walletAddress = EthereumAddress(walletAddress)
            let balance = try await web3.eth_getBalance(address: walletAddress, block: .Latest)
            
            return .success(balance)
        }catch(let error){
            return .failure(.unvalidBalance)
        }
    }
    
    func getTokenBalance(of contractAddress: String, walletAddress: String) async -> Result<BigUInt,BalanceErrorCallback> {
        do{
            let walletAddress = EthereumAddress(walletAddress)
            let contractAddress = EthereumAddress(contractAddress)
            
            let function = BalanceOf(contract: contractAddress, owner: walletAddress)
            let transaction = try function.transaction()
                        
            let response = try await web3.eth_call(transaction)
            
            guard let balance = BigUInt(hex: response) else { return .failure(.unvalidBalance) }
            
            return .success(balance)
        }catch (let error){
            print(error)
            return .failure(.unvalidBalance)
        }
    }
    
}
