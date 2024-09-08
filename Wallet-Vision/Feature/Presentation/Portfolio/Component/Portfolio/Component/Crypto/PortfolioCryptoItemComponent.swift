//
//  PortfolioCryptoItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct PortfolioCryptoItemComponent: View {
    
    let token : Token
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
                    Text("Ethereum")
                        .padding(3)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    Spacer()
                    Text("$\(token.balance)")
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
                    Text("$26.352.29")
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
        token: Token(name: "USDC", symbol: "USDC", contractAddress: ""),
        isHidedBalance: true
    )
}
