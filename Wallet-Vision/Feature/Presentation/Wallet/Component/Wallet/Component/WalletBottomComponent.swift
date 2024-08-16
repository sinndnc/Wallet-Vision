//
//  WalletBottomComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 16.08.2024.
//

import SwiftUI

fileprivate struct Option : Hashable {
    let label : String
    let systemName : String
}

fileprivate struct Options{
    
    static let send = Option(label: "Send", systemName: "arrow.up")
    static let receive = Option(label: "Receive", systemName: "arrow.down")
    static let swap = Option(label: "Swap", systemName: "arrow.left.arrow.right")
    static let buyAndSell = Option(label: "buy & Sell", systemName: "cart.badge.plus")
}


struct WalletBottomComponent: View {
    
    let childGeo : GeometryProxy
    let isHidedBalance : Bool
    
    private let options : [Option] = [Options.send,Options.receive,Options.swap,Options.buyAndSell,]
    
    var body: some View {
        HStack{
            ForEach(options,id: \.self){ option in
                Spacer()
                VStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: option.systemName)
                            .padding(10)
                            .font(.subheadline)
                            .background(.white)
                            .fontWeight(.medium)
                            .clipShape(Circle())
                    })
                    Text(option.label)
                        .font(.footnote)
                        .fontWeight(.medium)
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
