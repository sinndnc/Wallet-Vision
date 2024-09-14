//
//  SendView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 8.09.2024.
//

import Foundation
import SwiftUI

struct SendView: View {
    
    let token : Token
    @State private var isPresented : Bool = false
    @State private var addressTextField : String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                VStack(alignment: .leading){
                    Text("Address or Domain Name")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    HStack {
                        TextField("Search or Enter", text: $addressTextField)
                        ButtonWithHapticFeedback{
                            
                        }label: {
                            Text("Paste")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .tint(.white)
                        
                        ButtonWithHapticFeedback{
                            
                        }label: {
                            Image(systemName: "qrcode.viewfinder")
                        }
                        .tint(.white)
                        
                    }
                    .padding()
                    .overlay(
                      RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                }
                VStack(alignment: .leading){
                    Text("Amount")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    HStack{
                        TextField("\(token.name) Amount", text: $addressTextField)
                        ButtonWithHapticFeedback{
                            
                        }label: {
                            Text("Max")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .tint(.white)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Text("balance: $\(token.balance)")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }
                Spacer()
                NavigationLink {
                    SendConformationView()
                } label: {
                    Text("Next")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: geo.size.width)
                        .background(.green.opacity(0.9))
                        .clipShape(Capsule())
                }
                .tint(.white)

            }
            .navigationTitle("Send \(token.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}


#Preview {
    NavigationStack{
        SendView(token: Token(name: "USDT", symbol: "USDT"))
    }
}
