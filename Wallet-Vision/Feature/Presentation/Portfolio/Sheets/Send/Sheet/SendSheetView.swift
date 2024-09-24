//
//  SendSheetView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 29.08.2024.
//

import SwiftUI

struct SendSheetView: View {
    
    @State private var isPresented : Bool = false
    
    @StateObject var viewModel : PortfolioViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                ButtonWithHapticFeedback {
                    isPresented.toggle()
                } label: {
                    HStack{
                        Text(viewModel.networkSubject.value.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.bottom)
                }
                .tint(.white)
                ScrollView{
                    ForEach(ERCTokens.allCases.filter{ $0.network == viewModel.networkSubject.value },id: \.self){ token in
                        NavigationLink {
                            SendView(token: token)
                        } label: {
                            SendItemComponent(token: token)
                        }
                        .tint(.white)
                    }
                }
            }
            .padding()
            .navigationTitle("Send")
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
    SendSheetView(viewModel: PortfolioViewModel())
}
