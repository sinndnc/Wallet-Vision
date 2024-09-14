//
//  EstimateGas.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation
import BigInt

struct EstimateGasRequest : Encodable{
    let to: String
    let from : String
    let value : String
    
    
    enum TransactionCodingKeys: String, CodingKey {
        case from
        case to
        case value
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        var nested = container.nestedContainer(keyedBy: TransactionCodingKeys.self)
        try nested.encode(from, forKey: .from)
        try nested.encode(to, forKey: .to)
        try nested.encode(value, forKey: .value)
    }
    
}
