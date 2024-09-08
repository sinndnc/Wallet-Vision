//
//  SendNetworkItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

//TODO: burası için network classı yapılacak ardından buraya eklenecek şimdilik elle girdim
struct SendNetworkItemComponent: View {
    
    @Binding var selectedNetwork : Network
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button{
            selectedNetwork = .ethereum
            presentationMode.wrappedValue.dismiss()
        }label: {
            HStack{
                Image("ETH")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .background("ETH" == "ETH" ? .white : .clear)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .frame(width: 40,height: 40)
                Text("Ethereum")
                    .fontWeight(.semibold)
                Spacer()
            }
        }
        .tint(.white)
    }
}

#Preview {
    SendNetworkItemComponent(selectedNetwork: .constant(.allNetworks))
}
