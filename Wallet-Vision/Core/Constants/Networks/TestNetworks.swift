//
//  TestNetworks.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.09.2024.
//

import Foundation

struct TestNetworks{
    static let sepolia = Network(name: "Sepolia Tesnet", connectionName: "sepolia", chainID: 11155111, isTestnet: true)
    static let allCases = [sepolia]

}
