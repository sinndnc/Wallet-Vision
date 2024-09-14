//
//  SingleKeyStorage.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import web3


struct EthereumSingleKeyStorage : EthereumSingleKeyStorageProtocol{
    
    func storePrivateKey(key: Data) throws {
        
    }
    
    func loadPrivateKey() throws -> Data {
        Data(hex:"78c611ffc200f046754b2d5e44de7e4763643ae90793781f8213384a64f0b89d")!
    }
    
    
}
