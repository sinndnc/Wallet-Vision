//
//  WalletBottomComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

 enum Option {
    case receive
    case send
    case swap
    case buyAndSell
}

 struct Model : Hashable {
    var tag : Option
    var label : String
    var systemName : String
}

struct WalletBottomComponent: View {
    
    let childGeo : GeometryProxy
    let isHidedBalance : Bool
    
    @State var isPresented : Bool = false
    @State var selectedItem : Option? = nil

    @State var options = [
        Model(tag:.send,label: "Send", systemName: "arrow.up"),
        Model(tag:.receive,label: "Receive", systemName: "arrow.down"),
        Model(tag:.swap,label: "Swap", systemName: "arrow.left.arrow.right"),
        Model(tag:.buyAndSell,label: "buy & Sell", systemName: "cart.badge.plus")
    ]
    
    var body: some View {
        HStack{
            ForEach(options,id: \.self){ option in
                Spacer()
                NavigationLink(
                    value: option.tag
                ) {
                    VStack{
                        Image(systemName: option.systemName)
                            .padding(10)
                            .font(.subheadline)
                            .background(.white.opacity(0.3))
                            .fontWeight(.medium)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        Text(option.label)
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
            }
        }
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.3
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WalletBottomComponent(
            childGeo: geometry,
            isHidedBalance: .random()
        )
    })
}
