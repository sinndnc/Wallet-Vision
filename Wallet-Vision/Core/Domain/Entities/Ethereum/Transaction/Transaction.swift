//
//  Transaction.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 14.09.2024.
//

import Foundation


struct Transaction: Decodable , Hashable {
    let blockNumber: String
    let timeStamp: String
    let hash: String
    let from: String
    let to: String
    let value: String
    let gas: String
    let gasPrice: String
}

struct TransactionResponse: Decodable {
    let status: String
    let message: String
    let result: [Transaction]
}

