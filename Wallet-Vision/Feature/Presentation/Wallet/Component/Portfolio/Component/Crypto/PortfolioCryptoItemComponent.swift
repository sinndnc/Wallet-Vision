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
                .padding(7)
                .font(.title2)
                .background(.white)
                .clipShape(Circle())
                .foregroundStyle(.black)
            VStack{
                HStack{
                    Text("BTC")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Bitcoin")
                        .padding(3)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    Spacer()
                    Text("0.352")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .blur(radius: isHidedbalance ? 3 : 0)
                }
                HStack{
                    Text("$0.29")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Text("+3.19%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                    Spacer()
                    Text("$26.352.29")
                        .font(.caption)
                        .fontWeight(.semibold)
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
