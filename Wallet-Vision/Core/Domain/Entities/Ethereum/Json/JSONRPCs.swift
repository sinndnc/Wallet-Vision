//
//  JsonRPCRequest.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 13.09.2024.
//

import Foundation

struct JSONRPCRequest<P: Encodable>: Encodable {
    let jsonrpc: String
    let method: String
    let params: P
    let id: Int
}

struct JSONRPCResponse<U: Decodable>: Decodable {
    let result: U?
    let error: EthereumJsonError?
}
