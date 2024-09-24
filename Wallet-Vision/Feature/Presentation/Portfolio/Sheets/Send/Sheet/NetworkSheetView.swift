//
//  NetworkSheetVie.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct NetworkSheetView: View {
    
    @StateObject var viewModel : PortfolioViewModel
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationStack{
            ScrollView{
                SendNetworkItemComponent(viewModel: viewModel)
            }
            .padding()
            .navigationTitle("Networks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonWithHapticFeedback {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .tint(.white)
                }
            }
        }
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
        .presentationDetents([.fraction(0.8)])
    }
}

#Preview {
    NetworkSheetView(viewModel: PortfolioViewModel())
}
