//
//  Method.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 10.09.2024.
//

import Foundation

enum Method : String {
    
    case call = "eth_call"
    case gasPrice = "eth_gasPrice"
    case getBalance = "eth_getBalance"
    case estimateGas = "eth_estimateGas"
    case getTransactionCount = "eth_getTransactionCount"
    case sendRawTransaction = "eth_sendRawTransaction"
    
}
