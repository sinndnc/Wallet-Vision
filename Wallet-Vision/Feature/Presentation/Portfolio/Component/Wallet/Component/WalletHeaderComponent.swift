//
//  WalletHeaderComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 25.08.2024.
//

import SwiftUI

struct WalletHeaderComponent: View {
    
    let childGeo : GeometryProxy
    
    @StateObject var viewModel : PortfolioViewModel
    
    @State private var isPresented : Bool = false
    
    var body: some View {
        HStack {
            ButtonWithHapticFeedback(action: {
                withAnimation {
                    viewModel.isHidedBalance.toggle()
                }
            }, label: {
                Image(systemName: viewModel.isHidedBalance ? "eye.slash" : "eye")
                    .font(.footnote)
            })
            .tint(.white)
                                     
            ButtonWithHapticFeedback(action: {
                isPresented.toggle()
            }, label: {
                HStack(spacing:3){
                    Text("My Wallet")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            })
            .tint(.white)
            .sheet(
                isPresented: $isPresented,
                onDismiss: {},
                content: {
                    ZStack{
                        
                    }
                }
            )
            Spacer()
            ButtonWithHapticFeedback(action: {}, label: {
                Image(systemName: "doc.on.doc")
                    .font(.footnote)
            })
            .tint(.white)
            Button(action: {}, label: {
                Image(systemName: "qrcode")
                    .font(.subheadline)
            })
            .tint(.white)
            Button(action: {}, label: {
                Image(systemName: "bell")
                    .font(.subheadline)
            })
            .tint(.white)
        }
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.15
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WalletHeaderComponent(
            childGeo: geometry,
            viewModel: PortfolioViewModel()
        )
    })
}
