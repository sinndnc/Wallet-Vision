//
//  Network.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.09.2024.
//

import Foundation

struct MainNetworks{
    static let ethereum = Network(name: "Ethereum", connectionName: "mainnet", chainID: 1, isTestnet: false)
    static let allCases = [ethereum]
}

