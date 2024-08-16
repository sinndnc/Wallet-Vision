//
//  SplashView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject private var viewModel : SplashViewModel = SplashViewModel()
    
    var body: some View {
        if(viewModel.isAuthenticated){
            RootView()
        }else{
            OnBoardView()
        }
    }
}

#Preview {
    SplashView()
}
