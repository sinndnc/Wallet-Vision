//
//  WalletBodyComponent.swift
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

struct WalletBodyComponent: View {
    
    let childGeo : GeometryProxy
    @Binding var isHidedBalance : Bool
    @State private var selectedTab : Tab = .USD

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(Tab.allCases,id: \.self){ item in
                    VStack(spacing:5){
                        ButtonWithHapticFeedback {
                            withAnimation(.spring) {
                                selectedTab = item
                            }
                        } label: {
                            Text(item.rawValue)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        .tint(.white)
                        
                        if(selectedTab == item){
                            Rectangle()
                                .frame(width: 30,height: 2)
                        }
                    }
                }
            }
            Spacer()
            HStack{
                Text("$1.223.435")
                    .font(.title)
                    .fontWeight(.bold)
                    .blur(radius: isHidedBalance ? 6 : 0)
                Spacer()
                ButtonWithHapticFeedback {
                    withAnimation { isHidedBalance.toggle() }
                } label: {
                    Image(systemName: isHidedBalance ? "eye.slash" : "eye")
                }
                .tint(.white)
            }
        }
        .padding()
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.4
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WalletBodyComponent(
            childGeo: geometry,
            isHidedBalance: .constant(.random())
        )
    })
}
