//
//  EthereumClientErrorcallback.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 12.09.2024.
//

import Foundation

public enum EthereumClientError: Error, Equatable {
    case executionError(String)
    case notFoundAccount
    case decodedError
    case noResultFound
    case notFoundNonce
    case tooManyResults
    case notFoundGasPrice
    case encodedError
    case notFoundGasEstimate
    case unexpectedReturnValue
}
    
