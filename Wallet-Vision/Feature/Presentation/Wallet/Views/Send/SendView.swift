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
            VStack{
                BalanceComponent(baseGeo: baseGeo)
            }
        }
        .navigationTitle("Send Crypto")
        .toolbar{
            ToolbarItem(
                placement: .topBarTrailing
            ) {
                Button(
                    action: {
                        
                    }, label: {
                        Image(systemName:"qrcode")
                    })
                .tint(.white)
            }
        }
    }
}

#Preview {
    NavigationStack{
        SendView()
    }
}
