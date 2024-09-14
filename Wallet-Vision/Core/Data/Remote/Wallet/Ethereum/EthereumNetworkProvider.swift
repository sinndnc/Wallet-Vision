//
//  EthereumNetworkService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 10.09.2024.
//

import Foundation

final class EthereumNetworkProvider : EthereumNetworkProviderProtocol {
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeRequest<P: Encodable, U: Decodable>(method: Method, params: P, receive: U.Type) async throws -> U {
        
        let rpcRequest = JSONRPCRequest(jsonrpc: "2.0", method: method.rawValue, params: params, id: 1)
        
        print(rpcRequest)
        guard let jsonData = try? JSONEncoder().encode(rpcRequest) else {
            throw EthereumNetworkError.encodingFailed
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw EthereumNetworkError.networkError(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw EthereumNetworkError.invalidResponse
        }
        
        do {
            let rpcResponse = try JSONDecoder().decode(JSONRPCResponse<U>.self, from: data)
            
            print(rpcResponse)
            if let result = rpcResponse.result {
                return result
            } else if let error = rpcResponse.error {
                throw EthereumNetworkError.decodingError(NSError(domain: "", code: error.code, userInfo: [NSLocalizedDescriptionKey: error.message]))
            } else {
                throw EthereumNetworkError.noData
            }
        } catch {
            throw EthereumNetworkError.decodingError(error)
        }
    }
}
