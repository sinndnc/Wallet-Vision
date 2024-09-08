//
//  BalanceOf.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 7.09.2024.
//

import Foundation
import BigInt
import web3

public struct BalanceOf : ABIFunction{
    
    public static let name = "balanceOf"
       
    public var gasPrice: BigUInt?
    public var gasLimit: BigUInt?
    public var contract: EthereumAddress  // Token kontrat adresi
    public var from: EthereumAddress?  // Gönderen adres (isteğe bağlı)
    
    // balanceOf fonksiyonu için gerekli parametre: cüzdan adresi
    public let owner: EthereumAddress
    
    public init(contract: EthereumAddress, owner: EthereumAddress, from: EthereumAddress? = nil, gasPrice: BigUInt? = nil, gasLimit: BigUInt? = nil) {
        self.contract = contract
        self.owner = owner
        self.from = from
        self.gasPrice = gasPrice
        self.gasLimit = gasLimit
    }
    
       // ABIFunctionEncodable protokolünü implement eder
    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(owner) 
    }
    
}
