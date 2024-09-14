//
//  PortfolioView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @StateObject var viewModel : PortfolioViewModel
    
    var body: some View {
        NavigationStack{
            GeometryReader{ baseGeo in
                ScrollView(showsIndicators: false){
                    VStack{
                        WalletComponent(
                            baseGeo: baseGeo,
                            viewModel: viewModel
                        )
                        Divider()
                        PortfolioComponent(
                            baseGeo: baseGeo,
                            viewModel: viewModel
                        )
                    }
                }
            }
            .portfolioToolBar()
            .navigationTitle("Portfolio")
            .searchable(text: .constant(""))
            .toolbar{
                ToolbarItem(placement: .principal) {
                    ButtonWithHapticFeedback {
                        
                    } label: {
                    }
                }
            }
        }
        .task {
            await  viewModel.fetchTransactions()
            await viewModel.sendTransfer()
            await viewModel.getWalletBalance()
        }
    }
}

fileprivate extension View {
    
    func portfolioToolBar() -> some View {
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
    PortfolioView(viewModel: PortfolioViewModel())
}
