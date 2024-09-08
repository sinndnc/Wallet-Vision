//
//  CardView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 24.08.2024.
//

import SwiftUI

struct CardView: View {
    
    @StateObject var viewModel : CardViewModel
    @State var isHidedBalance : Bool = false
    
    var body: some View {
        NavigationStack{
            GeometryReader{ baseGeo in
                VStack{
                    CreditCardComponent(
                        baseGeo: baseGeo,
                        isHidedBalance: $isHidedBalance
                    )
                    TransactionComponent(
                        baseGeo: baseGeo
                    )
                }
            }
            .navigationTitle("Cards")            
        }
    }
}

#Preview {
    CardView(viewModel: CardViewModel())
}
