//
//  WalletComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 25.08.2024.
//

import SwiftUI

struct WalletComponent: View {
    
    let baseGeo : GeometryProxy
    @StateObject var viewModel : PortfolioViewModel
    
    var body: some View {
        GeometryReader{ childGeo in
            VStack(){
                WalletHeaderComponent(
                    childGeo: childGeo,
                    viewModel: viewModel
                )
                WalletBodyComponent(
                    childGeo: childGeo,
                    viewModel: viewModel
                )
            }
        }
        .padding()
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.height * 0.3
        )
    }
}

#Preview {
    GeometryReader{ geo in
        WalletComponent(baseGeo: geo,viewModel: PortfolioViewModel())
    }
}
    
