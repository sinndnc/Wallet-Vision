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
    
    @Inject private var ethService : EthereumRPCProviderProtocol
    @Inject var ethereumManager : EthereumProviderRepositoryProtocol
    
    
    func fetchTransactions() async {
        do{
            let transactions = try await ethereumManager.fetchTransactions(for: "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf")
        }
        catch (let error){
            print(error)
        }
    }
    
    func getWalletBalance() async {
        do{
            let balance = try await ethereumManager.getWalletBalance(of: "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf")
            DispatchQueue.main.async {
                self.balances = balance
            }
        }
        catch (let error){
            print(error)
        }
        
    }
    
    
    func sendTransfer() async {
        do {
            let tx = await try ethService.estimateGas(from: "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf", to: "0x9eed5312Dc4841AcE6B9b6A6d542abae40D79789", value: 110)
            print(tx)
        } catch (let error) {
            print(error)
        }
    }
}
