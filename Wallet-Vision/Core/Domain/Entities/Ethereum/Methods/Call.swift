//
//  EthCallResult.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation

struct EthCallRequest: Encodable {
    let to: String
    let data: String
    let block: String
    
    enum TransactionCodingKeys: String, CodingKey {
        case to
        case data
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        var nested = container.nestedContainer(keyedBy: TransactionCodingKeys.self)
        try nested.encode(to, forKey: .to)
        try nested.encode(data, forKey: .data)
        try container.encode(block)
    }
}
