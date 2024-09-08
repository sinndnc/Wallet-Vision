//
//  NetworkService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 23.08.2024.
//

import SwiftUI
import web3

protocol NetworkServiceProtocol {
        
    func connectToNetwork(url : URL) -> EthereumHttpClient
    
    func getBalance(url: URL,address: EthereumAddress) async 

}

class NetworkService : NetworkServiceProtocol {
    
    func connectToNetwork(url : URL) -> EthereumHttpClient {
        return EthereumHttpClient(url: url, network: .sepolia)
    }
    
    func getBalance(url: URL,address: EthereumAddress) async {
        do {
            let client = connectToNetwork(url: url)
            let balance = try await client.eth_getBalance(address: address, block: EthereumBlock.Latest)
            print(balance)
        } catch (let error) {
            print(error)
        }
    }
    
    
    
    
    
    
}
