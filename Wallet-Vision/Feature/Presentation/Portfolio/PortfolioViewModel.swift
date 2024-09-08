//
//  PortfolioViewModel.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import BigInt
import web3

final class PortfolioViewModel : ObservableObject{
    
    @Published var balances : [Token] = []
    @Published var isHidedBalance : Bool = false
    
    @Inject private var ethereumService : EthereumServiceRepositoryProtocol
    
    func getWalletBalance() async {
        let result = await ethereumService.getWalletBalance(of: "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf")
        
        switch result {
        case .success(let success):
            DispatchQueue.main.async {
                self.balances = success
            }
        case .failure(let failure):
            print(failure)
        }
        
    }
      
}
