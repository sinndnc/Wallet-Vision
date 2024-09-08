//
//  WalletService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 23.08.2024.
//

import Foundation
import web3

protocol WalletServiceProtocol {
    
    func getBalance(address : EthereumAddress) async
    
}

final class WalletService : WalletServiceProtocol {
    
    public var networkService : NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getBalance(address : EthereumAddress) async {
        let url = URL(string: "https://sepolia.infura.io/v3/52c2335b85164899816370c58ae0e2fd")!
        await networkService.getBalance(url: url, address: address)
    }
    
    
}
