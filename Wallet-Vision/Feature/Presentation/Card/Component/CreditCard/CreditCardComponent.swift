//
//  CreditCardComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct CreditCardComponent: View {
    
    let baseGeo : GeometryProxy
    @Binding var isHidedBalance : Bool
    
    private let colors : [Color] = [.blue,.cyan,.mint]
    
    var body: some View {
        GeometryReader{ childGeo in
            ZStack{
                AngularGradient(
                    colors: colors,
                    center: .center
                )
                .blur(radius: 20,opaque: true)
                VStack(spacing:0){
                    CreditCardHeaderComponent(
                        childGeo: childGeo,
                        isHidedBalance: isHidedBalance
                    )
                    CreditCardBodyComponent(
                        childGeo: childGeo,
                        isHidedBalance: $isHidedBalance
                    )
                    CreditCardBottomComponent(
                        childGeo: childGeo,
                        isHidedBalance: isHidedBalance
                    )
                }
            }
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding()
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.height * 0.4
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CreditCardComponent(
            baseGeo: geometry,
            isHidedBalance: .constant(.random())
        )
    })
}
