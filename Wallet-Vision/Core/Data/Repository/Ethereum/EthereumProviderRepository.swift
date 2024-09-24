//
//  EthereumWalletRepository.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import Combine
import BigInt

final class EthereumProviderRepository : EthereumProviderRepositoryProtocol{
    
    private var infuraProvider : InfuraRPCProviderProtocol
    private var walletAddress = "0xd7cd47a36e52772a068b13d59bcc80ede4e8d3bf"
    
    private var cancellables = Set<AnyCancellable>()
    public var networkSubject : CurrentValueSubject<Network, Never>
    
    init(networkSubject: CurrentValueSubject<Network, Never>) {
        self.networkSubject = networkSubject
        self.infuraProvider = InfuraRPCProvider(network: networkSubject.value)
        
        self.networkSubject
            .sink { [weak self] newNetwork in
                guard let self = self else { return }
                self.infuraProvider = InfuraRPCProvider(network: newNetwork)
            }
            .store(in: &cancellables)
    }
    
    func fetchData(for address : String) -> AnyPublisher<(BigUInt,[TokenUI]),EthereumNetworkError> {
        
        let balancePublisher = self.getEthBalance(for: address)
        let portfolioPublisher = self.getPortfolio(for: address)
        
        return Publishers.Zip(balancePublisher, portfolioPublisher)
            .eraseToAnyPublisher()
    }
    
    func fetchTestData(for address : String) -> AnyPublisher<BigUInt,EthereumNetworkError> {
        return getEthBalance(for: address).eraseToAnyPublisher()
    }
    
    func getPortfolio(for address: String) -> AnyPublisher<[TokenUI], EthereumNetworkError> {
        let publishers = ERCTokens.allCases.map { token in
            return getTokenBalance(of: token.contractAddress,for: address)
                .map { balance in
                    token.balance = balance.toDouble(decimals: token.decimals)
                    return token.toTokenUI(unitPrice: 2000)
                }
                .eraseToAnyPublisher()
        }
        
        return Publishers.MergeMany(publishers)
            .collect()
            .eraseToAnyPublisher()
    }
    
    private func getEthBalance(for address: String) -> AnyPublisher<BigUInt, EthereumNetworkError> {
        return infuraProvider.getBalance(for: address)
            .eraseToAnyPublisher()
    }
    
    private func getTokenBalance(of contractAddress: String, for address: String) -> AnyPublisher<BigUInt, EthereumNetworkError> {
        let balanceOf = "0x70a08231"
        let paddedAddress =  walletAddress.toPaddedAddress()
        let contractData = balanceOf + paddedAddress
        
        return infuraProvider.call(to: contractAddress, data: contractData, block: .latest)
            .tryMap { response in
                guard let balance = BigUInt(hex: response) else {
                    throw EthereumNetworkError.decodingError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid token balance format"]))
                }
                return balance
            }
            .mapError { error in
                if let ethError = error as? EthereumNetworkError {
                    return ethError
                } else {
                    return EthereumNetworkError.networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
    
}



fileprivate extension String {
    
    func toPaddedAddress() -> String {
        let trimmedString = self.lowercased().dropFirst(2)
        let paddingCount = max(0, 64 - trimmedString.count)
        let paddedString = String(repeating: "0", count: paddingCount) + trimmedString
        return paddedString
    }
}
