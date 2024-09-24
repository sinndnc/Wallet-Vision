//
//  PortfolioCryptoItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoItemComponent: View {
    
    let token : TokenUI
    let isHidedBalance : Bool
    
    var body: some View {
        HStack{
            Image(token.symbol)
                .resizable()
                .scaledToFit()
                .padding(5)
                .background(token.name == "ETH" ? .white : .clear)
                .clipShape(Circle())
                .foregroundStyle(.black)
                .frame(width: 40,height: 40)
            VStack{
                HStack{
                    Text(token.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(token.longName)
                        .padding(3)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    Spacer()
                    Text(String(token.amount.roundedToTwoDecimals()))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .blur(radius: isHidedBalance ? 5 : 0)
                    
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
                    Text("$" + String(token.value.roundedToTwoDecimals()))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .blur(radius: isHidedBalance ? 3 : 0)
                }
            }
        }
        Divider()
    }
}

#Preview {
    PortfolioCryptoItemComponent(
        token: TokenUI(name: "ETH", symbol: "", network: TestNetworks.sepolia, longName: "", value: .zero, amount: .zero, UnitPrice: .zero),
        isHidedBalance: true
    )
}
