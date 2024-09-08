//
//  CreditCardHeaderComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct CreditCardHeaderComponent: View {
    
    let childGeo : GeometryProxy
    let isHidedBalance : Bool
    
    var body: some View {
        HStack{
            Text("Wallet-Vision")
                .lineLimit(1)
                .font(.title2)
                .fontWeight(.medium)
                .truncationMode(.middle)
                .blur(radius: isHidedBalance ? 5 : 0)
            Spacer()
            Image(systemName: "wave.3.right")
        }
        .padding()
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.25
        )
        .background()
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CreditCardHeaderComponent(
            childGeo: geometry,
            isHidedBalance: .random()
        )
    })
}
