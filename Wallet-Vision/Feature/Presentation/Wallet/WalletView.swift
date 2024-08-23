//
//  WalletView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

struct WalletView: View {
    
    @StateObject var viewModel : WalletViewModel
    @State private var isHidedBalance : Bool = false

    var body: some View {
        NavigationStack{
            GeometryReader{ baseGeo in
                ScrollView(showsIndicators: false){
                    VStack{
                        WalletComponent(
                            baseGeo: baseGeo,
                            isHidedBalance: $isHidedBalance
                        )
                        PortfolioComponent(
                            baseGeo: baseGeo,
                            isHidedbalance: isHidedBalance
                        )
                    }
                }
            }
            .walletToolBar()
            .navigationTitle("Wallet")
            .walletNavigationDestination()
            .searchable(text: .constant(""))
           
        }
    }
}

fileprivate extension View {
    
    func walletNavigationDestination() -> some View {
        navigationDestination(
            for: Option.self,
            destination: { destination in
                switch destination{
                case .buyAndSell:
                    BuyAndSellView()
                case .receive:
                    ReceiveView()
                case .swap:
                    SwapView()
                case .send:
                    SendView()
                }
            }
        )
    }
    
    func walletToolBar() -> some View {
        toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {
                    
                    }, label: {
                        Image(systemName: "gear")
                    }
                )
                .tint(.white)
            }
        }
    }
    
}


#Preview {
    WalletView(viewModel: WalletViewModel())
}
