//
//  EthereumWalletManagerProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt

protocol EthereumRPCProviderProtocol{
    
    func gasPrice() async throws -> BigUInt 
    
    func getBalance(from walletAddress : String,block : Block) async throws -> BigUInt
    
    func call(to toAddress: String,data : String,block : Block) async throws -> String
    
    func getTransactionCount(from walletAddress: String, block : Block) async throws -> Int
    
    func getBalance(of contractAddres: String ,from walletAddress: String) async throws -> BigUInt
    
    func estimateGas(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> BigUInt
    
    func sendRawTransaction(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> String
}
