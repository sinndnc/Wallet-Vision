//
//  EthereumNetworkErrorCallback.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation

enum EthereumNetworkError: Error {
    case invalidURL
    case encodingFailed
    case networkError(Error)
    case invalidResponse
    case noData
    case decodingError(Error)
}
