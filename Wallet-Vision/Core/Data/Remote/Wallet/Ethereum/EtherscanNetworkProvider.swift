//
//  EtherscanNetworkProvider.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation


import Foundation

final class EtherscanNetworkProvider : EtherscanNetworkProviderProtocol{
    
    var api: String
    
    init() {
        self.api = "ETW35IT537SNJR1JPXUXMNM3NM5GE35N7N"
    }
    
    func fetchTransactions(for address: String) async throws -> [Transaction] {
        let urlString = "https://api.etherscan.io/api?module=account&action=txlist&address=\(address)&startblock=0&endblock=99999999&sort=asc&apikey=\(api)"
        
        guard let url = URL(string: urlString) else {
            throw EthereumNetworkError.invalidURL
        }
        
        let (data, httpResponse) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = httpResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw EthereumNetworkError.noData
        }
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(TransactionResponse.self, from: data)
        
        if response.status == "1" {
            return response.result
        } else {
            throw EthereumNetworkError.networkError(response.message as! Error)
        }
    }
}


