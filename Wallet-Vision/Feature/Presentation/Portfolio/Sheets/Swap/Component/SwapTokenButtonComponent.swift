//
//  SwapTokenButtonComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct SwapTokenButtonComponent: View {
    
    let geo : GeometryProxy
    
    var body: some View {
        ButtonWithHapticFeedback {
            
        } label: {
            Text("Preview Swap")
                .frame(
                    width: geo.size.width,
                    height: geo.size.height * 0.09
                )
                .font(.headline)
                .fontWeight(.semibold)
                .background(.blue)
                .clipShape(Capsule())
        }
        .tint(.white)
        .padding(.top)

    }
}

#Preview {
    GeometryReader(content: { geometry in
        SwapTokenButtonComponent(geo: geometry)
    })
}
