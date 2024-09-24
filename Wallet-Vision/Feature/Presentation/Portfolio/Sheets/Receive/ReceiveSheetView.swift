//
//  ReceiveSheetView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 29.08.2024.
//

import SwiftUI

struct ReceiveSheetView: View {
   
    @State private var isPresented : Bool = false
    
    @StateObject var viewModel : PortfolioViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                ButtonWithHapticFeedback {
                    isPresented.toggle()
                } label: {
                    HStack{
                        Text("All Networks")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom)
                }
                .tint(.white)
                ScrollView{
                    ForEach(ERCTokens.allCases,id: \.self){ token in
                        SendItemComponent(token: token)
                    }
                }
            }
            .padding()
            .navigationTitle("Receive")
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
            .searchable(text: .constant(""))
            .sheet(isPresented: $isPresented, content: {
                NetworkSheetView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    ReceiveSheetView(viewModel: PortfolioViewModel())
}
