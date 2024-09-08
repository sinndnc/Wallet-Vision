//
//  SendItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct SendItemComponent: View {
    
    let token : Token
    
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
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    Spacer()
                    Text("\(token.balance)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                HStack{
                    Text(token.name)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("$26.352.29")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        
                }
            }
        }
    }
}

#Preview {
    SendItemComponent(token: Token(name: "ETH", symbol: "ETH"))
}
