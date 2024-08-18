//
//  PortfolioComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI


fileprivate enum Tab : String , CaseIterable {
    case Crypto
    case NFTs
}

fileprivate struct PortfolioTabComponent: View {
    @Binding var selection : Tab
    var body: some View {
        Picker("Select tab",selection: $selection) {
            ForEach(Tab.allCases,id:\.self){ item in
                Text(item.rawValue).tag(item)
            }
        }
        .colorMultiply(.blue)
        .pickerStyle(.segmented)
    }
}


struct PortfolioComponent: View {
    
    let baseGeo : GeometryProxy
    let isHidedbalance : Bool
    @State private var selection : Tab = .Crypto

    var body: some View {
        VStack{
            PortfolioTabComponent(selection: $selection)
            switch selection {
            case .NFTs:
                PortfolioNFTComponent()
            case .Crypto:
                PortfolioCryptoComponent(isHidedbalance:isHidedbalance)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        PortfolioComponent(
            baseGeo: geometry,
            isHidedbalance: .random()
        )
    })
}
