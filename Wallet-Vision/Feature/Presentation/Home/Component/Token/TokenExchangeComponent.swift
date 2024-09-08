//
//  TokenExhanceComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct TokenExchangeComponent: View {
    
    let baseGeo : GeometryProxy
    @State private var offset: CGFloat = UIScreen.main.bounds.width
    @State private var animate = false
    
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
                TokenExchangeItemComponent(childGeo: baseGeo)
            }
            .offset(x: animate ? -baseGeo.size.width  : 0)
            .animation(Animation.linear(duration: Double(10))
                .repeatForever(autoreverses: false),value: animate
            )
            .onAppear {
                withAnimation {
                    animate = true
                }
            }
        }
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.width * 0.25
        )
        .clipped()
    }
}

#Preview {
    GeometryReader{ geo in
        TokenExchangeComponent(baseGeo: geo)
    }
}
