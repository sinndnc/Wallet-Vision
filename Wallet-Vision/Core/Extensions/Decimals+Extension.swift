//
//  Decimals+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.09.2024.
//

import Foundation


extension Decimal{
    
    func toDouble() -> Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
