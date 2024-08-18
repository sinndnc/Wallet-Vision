//
//  PortfolioCryptoComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoComponent: View {
        
    let isHidedbalance : Bool
    
    var body: some View {
        VStack{
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
            PortfolioCryptoItemComponent(isHidedbalance:isHidedbalance)
        }
        .padding(.vertical)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        PortfolioCryptoComponent(
            isHidedbalance: .random()
        )
    })
}
