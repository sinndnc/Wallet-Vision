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
    let decimals : Int
    let longName : String?
    let network : Network
    var balance: Double = .zero
    let contractAddress: String
    var totalSupply: BigUInt = .zero
    
    init(name: String,longName:String? = nil,network : Network,decimals: Int, symbol: String, contractAddress: String) {
        self.name = name
        self.symbol = symbol
        self.network = network
        self.longName = longName
        self.decimals = decimals
        self.contractAddress = contractAddress
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        return lhs.symbol == rhs.symbol
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(contractAddress)
    }
    
}


