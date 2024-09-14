//
//  EthereumWalletRepositoryProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import BigInt

protocol EthereumProviderRepositoryProtocol {
    
    func fetchTransactions(for address: String) async throws

    func getWalletBalance(of walletAddress : String) async throws -> [Token]
    
    func sendRawTransaction(from fromAddress : String, to toAddress: String , value: BigUInt) async throws

}
