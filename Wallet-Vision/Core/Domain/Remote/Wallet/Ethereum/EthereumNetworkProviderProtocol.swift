//
//  EthereumNetworkServiceProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 10.09.2024.
//

import Foundation

protocol EthereumNetworkProviderProtocol {
    
    var url: URL { get }
    
    func makeRequest<P: Encodable, U: Decodable>(method: Method, params: P, receive: U.Type) async throws -> U 

}
