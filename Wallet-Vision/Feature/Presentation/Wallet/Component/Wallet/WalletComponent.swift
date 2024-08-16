//
//  WalletComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

struct WalletComponent: View {
    
    
    let baseGeo : GeometryProxy
    
    @State private var isHidedBalance : Bool = false
    
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
                    WalletHeaderComponent(
                        childGeo: childGeo,
                        isHidedBalance: isHidedBalance
                    )
                    WalletBodyComponent(
                        childGeo: childGeo,
                        isHidedBalance: $isHidedBalance
                    )
                    WalletBottomComponent(
                        childGeo: childGeo,
                        isHidedBalance: isHidedBalance
                    )
                }
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
        WalletComponent(baseGeo: geometry)
    })
}
