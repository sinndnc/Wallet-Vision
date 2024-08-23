//
//  BalanceComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.08.2024.
//

import SwiftUI

struct BalanceComponent: View {
    
    let baseGeo : GeometryProxy
    
    var body: some View {
        VStack{
            HStack{
                ButtonWithHapticFeedback(
                    action: {
                    
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .padding(10)
                        .font(.title2)
                        .clipShape(Circle())
                })
                .tint(.white)
                
                Spacer()
                
                Text("$0.00")
                    .font(.custom("balance", size: 60))
                
                Spacer()
                
                ButtonWithHapticFeedback(
                    action: {
                    
                }, label: {
                    Text("Max")
                        .padding(10)
                        .font(.headline)
                        .clipShape(Circle())
                })
                .tint(.white)
            }
        }
        .padding()
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.height * 0.5
        )
    }
}

#Preview {
    GeometryReader { geometry in
        BalanceComponent(baseGeo : geometry)
    }
}
