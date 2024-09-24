//
//  PortfolioViewModel.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import Combine
import BigInt
import web3

final class PortfolioViewModel : ObservableObject{
           
    @Published var balance: BigUInt = 0
    @Published var portfolio : [TokenUI] = []
    @Published var errorMessage: String?
    
    @Published var totalBalance : Double = .zero
    @Published var isHidedBalance : Bool = false
    @Published var transactionHistory : [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var ethereumRepository : EthereumProviderRepository
    private var walletAddress = "0xd7cd47a36e52772a068b13d59bcc80ede4e8d3bf"
    var networkSubject = CurrentValueSubject<Network, Never>(MainNetworks.ethereum)
    
    init() {
        self.ethereumRepository = EthereumProviderRepository(networkSubject: networkSubject)
        self.networkSubject
            .sink { [weak self] newNetwork in
                guard let self = self else { return }
                if(newNetwork.isTestnet){
                    fetchTestData()
                }else{
                    fetchData()
                }
            }
            .store(in: &cancellables)
    }
    
    func updateNetworkChannel(for newChannel : Network){
        networkSubject.send(newChannel)
    }
  
    
    func fetchData(){
        ethereumRepository.fetchData(for: walletAddress)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { (balance, portfolio) in
                self.balance = balance
                self.portfolio = portfolio
            })
            .store(in: &cancellables)
    }
    
    func fetchTestData(){
        ethereumRepository.fetchTestData(for: walletAddress)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { balance in
                self.balance = balance
            })
            .store(in: &cancellables)
    }
    
    
    
//    @MainActor
//    func fetchTransactions(for address: String) async -> [Transaction] {
//        do {
//            let transactions = try await etherscanProvider.fetchTransactions(for: address)
//            if(!transactions.isEmpty){
//                return transactions
//            }else{
//                return []
//            }
//        } catch (let error) {
//            print(error)
//            return []
//        }
//    }
//    
//    @MainActor
//    func getBalance(of walletAddress : String) async {
//        do{
//            totalBalance = 0
//            for token in Tokens.allCases {
//                if let contractAddress = token.contractAddress{
//                    if(activeNetwork == MainNetworks.ethereum) {
//                        let balance = try await infuraProvider.getBalance(of: contractAddress, from: walletAddress)
//                        totalBalance += balance.toUSD(tokenPriceInUSD: 2400.95, decimals: token.decimals)
//                    }
//                }else{
//                    let balance = try await infuraProvider.getBalance(from: walletAddress,block: .latest)
//                    totalBalance += balance.toUSD(tokenPriceInUSD: 2400.95, decimals: token.decimals)
//                }
//            }
//        }
//        catch (let error){
//        }
//    }
//    
//    @MainActor
//    func getPortfolio(of walletAddress : String) async {
//        do{
//            tokens.removeAll()
//            for token in Tokens.allCases {
//                if let contractAddress = token.contractAddress{
//                    if(activeNetwork == MainNetworks.ethereum) {
//                        let balance = try await infuraProvider.getBalance(of: contractAddress, from: walletAddress)
//                        token.balance = balance.toDouble(decimals: token.decimals)
//                        tokens.append(token.toTokenUI(unitPrice: 2400.95))
//                    }
//                }else{
//                    let balance = try await infuraProvider.getBalance(from: walletAddress,block: .latest)
//                    token.balance = balance.toDouble(decimals: token.decimals)
//                    self.tokens.append(token.toTokenUI(unitPrice: 2400.95))
//                }
//            }
//        }
//        catch (let error){
//            print(error)
//        }
//    }
//    
//    
//    
//    func sendTransfer(to: String,amount: BigUInt) async {
//        do {
//            let toAddressPadded = String(repeating: "0", count: 24) + to.dropFirst(2)
//            guard let transferMethodSignature = "transfer(address,uint256)".toFucHash() else { return }
//            
//            let amountHex = String(amount, radix: 16)
//            let amountPadded = String(repeating: "0", count: 64 - amountHex.count) + amountHex
//            
//            let dataHexString = transferMethodSignature + toAddressPadded + amountPadded
//            let data = Data(hex: dataHexString)
//            
//            let tx = try await infuraProvider.sendRawTransaction(to: to, value: amount, data: Data(), chain: .sepolia)
//        } catch (let error) {
//            print(error)
//        }
//    }
    
}
