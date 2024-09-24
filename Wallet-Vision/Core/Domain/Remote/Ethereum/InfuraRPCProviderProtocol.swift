//
//  EthereumWalletManagerProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import Combine
import BigInt

protocol InfuraRPCProviderProtocol{
    
//    func gasPrice() async throws -> BigUInt 
//    
//    
//    func getTransactionCount(from walletAddress: String, block : Block) async throws -> Int
//    
//    func getBalance(of contractAddres: String ,from walletAddress: String) async throws -> BigUInt
//    
//    func estimateGas(from fromAddress : String, to toAddress: String , value: BigUInt) async throws -> BigUInt
//    
//    func sendRawTransaction(to toAddress: String , value: BigUInt?, data : Data?, chain : Chain) async throws -> String
//    
    func getBalance(for address: String) -> AnyPublisher<BigUInt, EthereumNetworkError>
    
    func call(to toAddress: String,data : String,block : Block) -> AnyPublisher<String, EthereumNetworkError>
    
}
