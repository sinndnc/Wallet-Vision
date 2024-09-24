//
//  Token+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.09.2024.
//

import Foundation

extension Token {
    func toTokenUI(unitPrice: Double) -> TokenUI {
        let value = Double(self.balance) * unitPrice
        return TokenUI(name: self.name,
                       symbol: self.symbol,
                       network: self.network,
                       longName: self.longName ?? "",
                       value: value,
                       amount: Double(self.balance),
                       UnitPrice: unitPrice)
    }
}
