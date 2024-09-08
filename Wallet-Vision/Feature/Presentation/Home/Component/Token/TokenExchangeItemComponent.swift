//
//  TokenExchangeItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct TokenExchangeItemComponent: View {
    
    let childGeo : GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading){
            Text("53.09%")
                .font(.subheadline)
                .foregroundStyle(.gray)
            Spacer()
            Text("ETH")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            HStack{
                Spacer()
                Text("+0.33%")
                    .font(.subheadline)
                    .foregroundStyle(.green)
            }
        }
        .padding(10)
        .background(.green.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(2)
        .frame(
            width: childGeo.size.width * 0.25,
            height: childGeo.size.width * 0.25
        )
     
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TokenExchangeItemComponent(childGeo: geometry)
    })
}
