//
//  CreditCardBodyComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

fileprivate enum Tab : String , CaseIterable{
    case USD
    case BTC
    case ETH
}

struct CreditCardBodyComponent: View {
    
    let childGeo : GeometryProxy
    @Binding var isHidedBalance : Bool
    @State private var selectedTab : Tab = .USD

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("$1.223.435")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .blur(radius: isHidedBalance ? 6 : 0)
                
            }
            Spacer()
            HStack {
                Text("**** **** **** 3658")
                    .font(.title2)
                    .fontWeight(.medium)
               
            }
        }
        .padding()
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.5,
            alignment: .leading
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CreditCardBodyComponent(
            childGeo: geometry,
            isHidedBalance: .constant(.random())
        )
    })
}
