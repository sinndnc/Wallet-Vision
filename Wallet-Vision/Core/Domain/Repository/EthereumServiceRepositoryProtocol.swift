//
//  EthereumWalletRepositoryProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import BigInt

protocol EthereumServiceRepositoryProtocol {
    
    func getWalletBalance(of walletAddress : String) async -> Result<[Token],BalanceErrorCallback>
    
//    func sendToken(to receiveAddress : String) 
    
}
