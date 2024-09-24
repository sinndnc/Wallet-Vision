//
//  Double+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.09.2024.
//

import Foundation

extension Double{
    
    func roundedToTwoDecimals() -> Double {
        return (self * 100).rounded() / 100
    }
}
