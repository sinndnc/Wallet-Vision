//
//  WalletVisionAppDelegate.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import UIKit
import SwiftUI

final class WalletVisionAppDelegate : NSObject, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        setupDIDependencies()
        
        return true
    }
}

fileprivate extension WalletVisionAppDelegate{
    
    func setupDIDependencies() {
        DIInjectContainer.register(type: NFCServiceProtocol.self , NFCService())
        DIInjectContainer.register(type: FaceIDServiceProtocol.self , FaceIDService())
//        DIInjectContainer.register(type: InfuraRPCProviderProtocol.self , InfuraRPCProvider())
        DIInjectContainer.register(type: EtherscanNetworkProviderProtocol.self , EtherscanNetworkProvider())
//        DIInjectContainer.register(type: EthereumProviderRepositoryProtocol.self , EthereumProviderRepository())
    }
}
