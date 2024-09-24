//
//  BigUInt+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.09.2024.
//

import Foundation
import BigInt

extension BigUInt {
    
    func toDecimal() -> Decimal {
          let bigUIntDecimal = Decimal(string: self.description) ?? Decimal(0)
          return bigUIntDecimal
    }
    
    func toDecimal(_ decimals: Int) -> Decimal {
        let bigUIntDecimal = Decimal(string: self.description) ?? Decimal(0)
        let factor = Decimal(pow(10.0, Double(decimals)))
        return bigUIntDecimal / factor
    }
    
    func toDouble(decimals: Int) -> Double {
        let decimalValue = self.toDecimal(decimals)
        return decimalValue.toDouble()
    }
    
    func toUSD(tokenPriceInUSD: Double, decimals: Int) -> Double {
        let decimalValue = self.toDecimal()
        let factor = Decimal(pow(10.0, Double(decimals)))
        let usdValueDecimal = (decimalValue / factor) * Decimal(tokenPriceInUSD)
        return NSDecimalNumber(decimal: usdValueDecimal).doubleValue.roundedToTwoDecimals()
    }
    
}
