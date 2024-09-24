//
//  EthereumNetworkService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 10.09.2024.
//

import Combine
import Foundation

final class EthereumNetworkProvider : EthereumNetworkProviderProtocol {
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeRequest<P: Encodable, U: Decodable>(method: Methods, params: P, receive: U.Type) -> AnyPublisher<U, EthereumNetworkError> {
        
        let rpcRequest = JSONRPCRequest(jsonrpc: "2.0", method: method.rawValue, params: params, id: 1)
        
        guard let jsonData = try? JSONEncoder().encode(rpcRequest) else {
            return Fail(error: EthereumNetworkError.encodingFailed)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw EthereumNetworkError.invalidResponse
                }
                return output.data
            }
            .decode(type: JSONRPCResponse<U>.self, decoder: JSONDecoder())
            .tryMap { rpcResponse in
                if let result = rpcResponse.result {
                    return result
                } else if let error = rpcResponse.error {
                    throw EthereumNetworkError.decodingError(NSError(domain: "", code: error.code, userInfo: [NSLocalizedDescriptionKey: error.message]))
                } else {
                    throw EthereumNetworkError.noData
                }
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
    
}
