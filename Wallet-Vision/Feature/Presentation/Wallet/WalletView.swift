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
            GeometryReader{baseGeo in
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
            .navigationTitle("Wallet")
            .navigationDestination(
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
    }
}

#Preview {
    WalletView(viewModel: WalletViewModel())
}
