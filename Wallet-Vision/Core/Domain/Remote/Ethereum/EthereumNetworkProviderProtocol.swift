//
//  EthereumNetworkServiceProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 10.09.2024.
//

import Combine
import Foundation

protocol EthereumNetworkProviderProtocol {
    
    var url: URL { get }
    
    func makeRequest<P: Encodable, U: Decodable>(method: Methods, params: P, receive: U.Type) -> AnyPublisher<U, EthereumNetworkError>

}
