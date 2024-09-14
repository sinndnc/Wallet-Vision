//
//  RootViewModel.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation

final class RootViewModel : ObservableObject {
    
    @Inject var ethereumWallet : EthereumProviderRepositoryProtocol
    
}
