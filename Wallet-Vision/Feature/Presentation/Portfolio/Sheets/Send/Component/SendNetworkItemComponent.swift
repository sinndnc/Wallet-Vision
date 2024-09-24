//
//  SendNetworkItemComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct SendNetworkItemComponent: View {
    
    @StateObject var viewModel : PortfolioViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(MainNetworks.allCases,id: \.self){ network in
                Button{
                    viewModel.updateNetworkChannel(for: network)
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack{
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .foregroundStyle(.black)
                            .frame(width: 30,height:30)
                        Text(network.name)
                            .fontWeight(.medium)
                        Spacer()
                    }
                }
            }
            Divider()
            Text("Tesnets")
                .font(.headline)
            ForEach(TestNetworks.allCases,id: \.self){ network in
                Button{
                    viewModel.updateNetworkChannel(for: network)
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack{
                        Text(String(network.name.first!))
                            .padding(10)
                            .background(.pink)
                            .clipShape(Circle())
                            .fontWeight(.medium)
                            .frame(width: 30,height:30)
                        Text(network.name)
                            .fontWeight(.medium)
                        Spacer()
                    }
                }
            }
        }
        .tint(.white)
    }
}

#Preview {
    SendNetworkItemComponent(viewModel: PortfolioViewModel())
}
