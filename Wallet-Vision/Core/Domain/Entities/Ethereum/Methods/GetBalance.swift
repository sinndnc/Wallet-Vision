//
//  GetBalance.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation

struct GetBalance : Encodable{
    let from : String
    let block : String
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(from)
        try container.encode(block)
    }
    
}
