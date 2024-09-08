//
//  SwapSheetView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 30.08.2024.
//

import SwiftUI

struct SwapSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                VStack{
                    SwapTokenPreviewComponent(geo: geo)
                    SwapTokenButtonComponent(geo:geo)
                }
            }
            .padding()
            .navigationTitle("Swap")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
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
    }
}

#Preview {
    SwapSheetView()
}
