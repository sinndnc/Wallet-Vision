//
//  EthereumJsonError.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation

struct EthereumJsonError: Decodable {
    let code: Int
    let message: String
}
