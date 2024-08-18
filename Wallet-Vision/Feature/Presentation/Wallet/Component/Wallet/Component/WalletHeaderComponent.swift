//
//  WalletHeaderComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct WalletHeaderComponent: View {
    
    let childGeo : GeometryProxy
    let isHidedBalance : Bool
    
    //Test
    private let testAdress = "0xd7CD47A36E52772A068b13d59bCc80EdE4e8D3Bf"

    var body: some View {
        HStack{
            Image(systemName: "wave.3.right")
            Spacer()
            Text(testAdress)
                .lineLimit(1)
                .font(.subheadline)
                .truncationMode(.middle)
                .blur(radius: isHidedBalance ? 5 : 0)
                .frame(width: childGeo.size.width * 0.75)
            
            ButtonWithHapticFeedback {
                UIPasteboard.general.string = testAdress
            } label: {
                Image(systemName: "doc.on.doc.fill")
                    .font(.caption)
            }
            .tint(.white)
        }
        .padding()
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.2,
            alignment: .bottom
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WalletHeaderComponent(
            childGeo: geometry,
            isHidedBalance: .random()
        )
    })
}
