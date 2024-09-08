//
//  Tokens.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation


class Tokens {
    
    static let ETH = Token(name: "ETH", symbol: "ETH")
    static let USDC = Token(name: "USDC", symbol: "USDC", contractAddress: "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48")
    static let BNB = Token(name: "BNB", symbol: "BNB", contractAddress: "0xB8c77482e45F1F44dE1745F52C74426C631bDD52")
    static let USDT = Token(name: "USDT", symbol: "USDT", contractAddress: "0xdAC17F958D2ee523a2206206994597C13D831ec7")
    
    static var list: [Token] {
        return [ETH, USDC, BNB, USDT]
    }
    
    static func addToken(name: String, symbol: String, contractAddress: String?) {
        let newToken = Token(name: name, symbol: symbol, contractAddress: contractAddress)
    }
}
