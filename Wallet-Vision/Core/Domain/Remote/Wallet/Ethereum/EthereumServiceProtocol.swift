//
//  EthereumWalletManagerProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 5.09.2024.
//

import Foundation
import BigInt

protocol EthereumServiceProtocol{
    
    func getETHBalance(walletAddress : String) async -> Result<BigUInt,BalanceErrorCallback>
    
    func getTokenBalance(of contractAddress: String, walletAddress: String) async -> Result<BigUInt,BalanceErrorCallback>
    
}
