//
//  CreditCardBottomComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct CreditCardBottomComponent: View {
    
    let childGeo : GeometryProxy
    let isHidedBalance : Bool
        
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("VALID")
                    .font(.footnote)
                Text("08/22")
                    .font(.caption)
            }
            VStack(alignment: .leading){
                Text("CVV")
                    .font(.footnote)
                Text("330")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "circlebadge.2")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .padding()
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.25
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CreditCardBottomComponent(
            childGeo: geometry,
            isHidedBalance: .random()
        )
    })
}
