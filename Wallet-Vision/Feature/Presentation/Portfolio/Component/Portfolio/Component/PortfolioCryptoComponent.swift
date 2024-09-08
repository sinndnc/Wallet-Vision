//
//  PortfolioCryptoComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoComponent: View {
        
    let isHidedBalance : Bool
    
    var body: some View {
        VStack{
            ForEach(Tokens.list,id: \.self){ token in
                NavigationLink {
                    TokenView(token: token)
                } label: {
                    PortfolioCryptoItemComponent(
                        token: token,
                        isHidedBalance:isHidedBalance
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
            isHidedBalance: .random()
        )
    })
}
