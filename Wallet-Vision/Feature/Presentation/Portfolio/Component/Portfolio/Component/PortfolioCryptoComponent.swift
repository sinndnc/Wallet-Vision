//
//  PortfolioCryptoComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoComponent: View {
        
    @StateObject var viewModel : PortfolioViewModel
    
    var body: some View {
        VStack{
            ForEach(viewModel.portfolio.filter{ $0.network == viewModel.networkSubject.value },id: \.self){ token in
                NavigationLink {
                    TokenView(token: token)
                } label: {
                    PortfolioCryptoItemComponent(
                        token: token,
                        isHidedBalance: viewModel.isHidedBalance
                    )
                }
            }
            .tint(.white)
        }
        .padding(.vertical)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        PortfolioCryptoComponent(
            viewModel: PortfolioViewModel()
        )
    })
}
