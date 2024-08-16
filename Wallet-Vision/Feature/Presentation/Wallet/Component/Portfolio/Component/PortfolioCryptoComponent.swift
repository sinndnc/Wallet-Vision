//
//  PortfolioCryptoComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoComponent: View {
        
    var body: some View {
        VStack{
            PortfolioCryptoItemComponent()
            PortfolioCryptoItemComponent()
            PortfolioCryptoItemComponent()
            PortfolioCryptoItemComponent()
            PortfolioCryptoItemComponent()
            PortfolioCryptoItemComponent()
        }
        .padding()
    }
}

#Preview {
    GeometryReader(content: { geometry in
        PortfolioCryptoComponent()
    })
}
