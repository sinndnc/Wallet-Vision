//
//  EtherscanNetworkProviderProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation

protocol EtherscanNetworkProviderProtocol{
    
    var api : String { get }
    
    func fetchTransactions(for address: String) async throws -> [Transaction]
    
}
