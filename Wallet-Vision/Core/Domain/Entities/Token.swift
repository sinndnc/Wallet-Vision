//
//  Token.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt

class Token : Hashable{
    let name: String
    let symbol: String
    let contractAddress: String?
    var balance: BigUInt = .zero
    var totalSupply: BigUInt = .zero
    
    init(name: String, symbol: String, contractAddress: String? = nil) {
        self.name = name
        self.symbol = symbol
        self.contractAddress = contractAddress
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        return lhs.contractAddress == rhs.contractAddress
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(contractAddress)
    }
    
}
