//
//  Tokens.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation


class ERCTokens{
    
    static let SepoliaETH = Token(name: "SepoliaETH",longName: "SepoliaETH",network: TestNetworks.sepolia, decimals: 18, symbol: "SepoliaETH", contractAddress: "")
    static let ETH = Token(name: "ETH",longName: "Ethereum",network: MainNetworks.ethereum, decimals: 18, symbol: "ETH", contractAddress: "")
    
    static let USDC = Token(name: "USDC",longName: "USDC",network: MainNetworks.ethereum,decimals: 6, symbol: "USDC", contractAddress: "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48")
    static let USDT = Token(name: "USDT",longName: "USDT-Tether",network: MainNetworks.ethereum, decimals: 6, symbol: "USDT", contractAddress: "0xdAC17F958D2ee523a2206206994597C13D831ec7")
    static let XRP = Token(name: "XRP",longName: "Ripple",network: MainNetworks.ethereum, decimals: 6, symbol: "XRP", contractAddress: "0x628F76eAB0C1298F7a24d337bBbF1ef8A1Ea6A24")
    static let ATOM = Token(name: "ATOM",longName: "Cosmos",network: MainNetworks.ethereum, decimals: 6, symbol: "ATOM", contractAddress: "0x8D983cb9388EaC77af0474fA441C4815500Cb7BB")
    static let ARB = Token(name: "ARB",longName: "Arbitrum",network: MainNetworks.ethereum, decimals: 18, symbol: "ARB", contractAddress: "0xB50721BCf8d664c30412Cfbc6cf7a15145234ad1")
    static let BNB = Token(name: "BNB",longName: "BNB Smart Chain",network: MainNetworks.ethereum, decimals: 18, symbol: "BNB", contractAddress: "0xB8c77482e45F1F44dE1745F52C74426C631bDD52")
    
    static var allCases: [Token] {
        return [USDC, USDT,XRP, ATOM, ARB, BNB ]
    }
    
    static func addToken(name: String,decimals: Int, symbol: String, contractAddress: String) {
        let newToken = Token(name: name, network : MainNetworks.ethereum, decimals: decimals,symbol: symbol, contractAddress: contractAddress)
    }
    
}
