//
//  Wallet_VisionApp.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

@main
struct WalletVisionApp: App {
    
    @UIApplicationDelegateAdaptor(WalletVisionAppDelegate.self) private var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                SplashView()
                    .navigationDestination(
                        isPresented: .constant(true)
                    ) {
                        RootView()
                    }
            }
        }
    }
}
