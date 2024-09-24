//
//  WalletBalance.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.09.2024.
//

import Foundation
import BigInt

class TokenUI : Hashable {
    let name: String
    var value : Double
    let symbol: String
    var amount : Double
    let network : Network
    let longName : String
    var UnitPrice : Double
    
    init(name: String, symbol: String,network: Network, longName: String, value: Double, amount: Double, UnitPrice: Double) {
        self.name = name
        self.symbol = symbol
        self.longName = longName
        self.value = value
        self.amount = amount
        self.UnitPrice = UnitPrice
        self.network = network
    }
    
    static func == (lhs: TokenUI, rhs: TokenUI) -> Bool {
        return lhs.symbol == rhs.symbol
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(symbol)
    }
    
}
