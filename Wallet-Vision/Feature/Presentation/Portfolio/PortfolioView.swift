//
//  PortfolioView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI
import BigInt

struct PortfolioView: View {
    
    @StateObject var viewModel : PortfolioViewModel = PortfolioViewModel()
    
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
                        if(viewModel.networkSubject.value == MainNetworks.ethereum){
                            viewModel.updateNetworkChannel(for: TestNetworks.sepolia)
                        }else{
                            viewModel.updateNetworkChannel(for: MainNetworks.ethereum)
                        }
                    } label: {
                        Text("Switch")
                    }
                }
            }
        }
        .onAppear{
            viewModel.fetchData()
//            await viewModel.getBalance(of: "0xd7cd47a36e52772a068b13d59bcc80ede4e8d3bf")
//            await viewModel.getPortfolio(of: "0xd7cd47a36e52772a068b13d59bcc80ede4e8d3bf")
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
    PortfolioView()
}
