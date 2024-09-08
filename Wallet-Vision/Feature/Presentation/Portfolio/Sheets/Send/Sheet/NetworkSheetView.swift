//
//  NetworkSheetVie.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct NetworkSheetView: View {
    
    @Binding var selectedNetwork : Network
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            ScrollView{
                SendNetworkItemComponent(selectedNetwork: $selectedNetwork)
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
    NetworkSheetView(selectedNetwork: .constant(.allNetworks))
}
