//
//  Transfer.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt
import web3

public struct Transfer: ABIFunction {
    
    public static let name = "transfer"
    public let gasPrice: BigUInt? = nil
    public let gasLimit: BigUInt? = nil
    public var contract: EthereumAddress
    public let from: EthereumAddress?

    public let to: EthereumAddress?
    public let value: BigUInt?

    public init(
        contract: EthereumAddress,
        from: EthereumAddress? = nil,
        to: EthereumAddress? = nil,
        value: BigUInt? = nil
    ) {
        self.contract = contract
        self.from = from
        self.to = to
        self.value = value
    }

    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(to ?? .zero)
        try encoder.encode(value ?? .zero)
    }
}

