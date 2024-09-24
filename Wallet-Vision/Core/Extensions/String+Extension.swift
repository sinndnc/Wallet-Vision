//
//  String+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 17.09.2024.
//

import Foundation


extension String{
    
    func toFucHash() -> String? {
        // 3. Keccak-256 ile hashle
        guard let hash = self.data(using: .utf8)?.web3.keccak256 else {
            return nil
        }

        // 4. İlk 4 byte'ı al ve hexadecimal'e çevir
        return hash.prefix(4).map { String(format: "%02x", $0) }.joined()
    }
}
