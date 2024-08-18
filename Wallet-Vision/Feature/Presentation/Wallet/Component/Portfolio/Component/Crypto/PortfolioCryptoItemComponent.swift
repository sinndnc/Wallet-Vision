//
//  PortfolioCryptoItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoItemComponent: View {
    
    let isHidedbalance : Bool
    
    var body: some View {
        HStack{
            Image(systemName: "bitcoinsign")
                .font(.title2)
            VStack{
                HStack{
                    Text("Bitcoin (BTC)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Spacer()
                    Text("0.352")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .blur(radius: isHidedbalance ? 3 : 0)
                }
                HStack{
                    Text("$0.29")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    Text("+3.19%")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.green)
                    Spacer()
                    Text("$26.352.29")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .blur(radius: isHidedbalance ? 3 : 0)
                }
            }
        }
        Divider()
    }
}

#Preview {
    PortfolioCryptoItemComponent(
        isHidedbalance: .random()
    )
}
