//
//  PBKDF2Manager.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 9.09.2024.
//

import Foundation
import CommonCrypto

class PBKDF2Manager {
    
    static func deriveKeyFromPassword(password: String, salt: Data, keySize: Int = kCCKeySizeAES256, rounds: Int = 10_000) -> Data? {
        let passwordData = Data(password.utf8)
        var derivedKey = Data(count: keySize)
        
        let status = derivedKey.withUnsafeMutableBytes { derivedKeyBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password,
                    passwordData.count,
                    saltBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
                    UInt32(rounds),
                    derivedKeyBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    keySize
                )
            }
        }
        
        return status == kCCSuccess ? derivedKey : nil
    }
}
