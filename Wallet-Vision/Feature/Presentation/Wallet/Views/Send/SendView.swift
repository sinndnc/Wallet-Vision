//
//  SendView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 17.08.2024.
//

import SwiftUI

struct SendView: View {
    
    var body: some View {
        GeometryReader{ baseGeo in
            VStack(alignment: .leading){
                
                BalanceComponent(baseGeo: baseGeo)
                KeyboardComponent(baseGeo : baseGeo)
            }
        }
        .padding(.bottom)
        .safeAreaPadding()
        .navigationTitle("Send")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: .constant(""))
        
    }
}

#Preview {
    NavigationStack{
        SendView()
    }
}
