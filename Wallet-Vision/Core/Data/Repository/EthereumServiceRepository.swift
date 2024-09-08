//
//  EthereumWalletRepository.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import BigInt

final class EthereumServiceRepository : EthereumServiceRepositoryProtocol{
    
    @Inject private var ethereumWalletManager : EthereumServiceProtocol
        
    func getWalletBalance(of walletAddress : String) async  -> Result<[Token],BalanceErrorCallback> {
        for token in Tokens.list {
            if let contractAddress = token.contractAddress{
                let result = await ethereumWalletManager.getTokenBalance(of: contractAddress,walletAddress: walletAddress)
                switch result {
                case .success(let balance):
                    DispatchQueue.main.async {
                        token.balance = balance
                    }
                case .failure(let failure):
                    print(failure)
                }
            }else{
                let result = await ethereumWalletManager.getETHBalance(walletAddress: walletAddress)
                
                switch result {
                case .success(let balance):
                    DispatchQueue.main.async {
                        token.balance = balance
                    }
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        return .success(Tokens.list)
    }
    
}
