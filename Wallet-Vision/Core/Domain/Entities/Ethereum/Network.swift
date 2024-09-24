//
//  Network.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation


struct Network : Hashable , Codable {
    let name: String
    let connectionName: String
    let chainID: Int
    let isTestnet: Bool
}

