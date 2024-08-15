//
//  WalletVisionAppDelegate.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import UIKit

final class WalletVisionAppDelegate : NSObject, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        setupDIDependencies()
        
        return true
    }
    
}


fileprivate extension WalletVisionAppDelegate{
    
    func setupDIDependencies() {
        DIInjectContainer.register(type: NFCServiceProtocol.self , NFCService())
    }
}
