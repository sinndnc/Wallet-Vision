//
//  WalletView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

struct WalletView: View {
    
    @StateObject var viewModel : WalletViewModel
    
    
    var body: some View {
        NavigationStack{
            GeometryReader{baseGeo in
                ScrollView{
                    VStack{
                        WalletComponent(baseGeo: baseGeo)
                        PortfolioComponent(baseGeo: baseGeo)
                    }
                }
            }
            .navigationTitle("Wallet")
        }
    }
}

#Preview {
    WalletView(viewModel: WalletViewModel())
}
