//
//  PortfolioComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI


fileprivate enum Tab : String , CaseIterable {
    case Crypto
    case NFT
}

fileprivate struct PortfolioTabComponent: View {
    @Binding var selection : Tab
    var body: some View {
        HStack{
            Spacer()
            Button(action: { selection = Tab.Crypto }, label: {
                Text("Crypto")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(selection == .Crypto ? .white : .gray)
            })
            Spacer()
            Spacer()
            Button(action: { selection = Tab.NFT }, label: {
                Text("NFTs")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(selection == .NFT ? .white : .gray)
            })
            Spacer()
        }
    }
}


struct PortfolioComponent: View {
    
    let baseGeo : GeometryProxy
    @StateObject var viewModel : PortfolioViewModel
    
    @State private var selection : Tab = .Crypto

    var body: some View {
        VStack(spacing: 0){
            PortfolioTabComponent(selection: $selection)
            switch selection {
            case .Crypto:
                PortfolioCryptoComponent(viewModel: viewModel)
            case .NFT:
                PortfolioNFTComponent()
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        PortfolioComponent(
            baseGeo: geometry,
            viewModel: PortfolioViewModel()
        )
    })
}
