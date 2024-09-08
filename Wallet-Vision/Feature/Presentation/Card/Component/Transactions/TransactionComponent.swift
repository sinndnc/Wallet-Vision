//
//  TransactionComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 24.08.2024.
//

import SwiftUI

struct TransactionComponent: View {
    
    let baseGeo : GeometryProxy
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Transactions")
                    .padding(.bottom)
                    .font(.title2)
                    .fontWeight(.semibold)
                ScrollView(showsIndicators: false){
                    HStack{
                        Image(systemName: "figure.cooldown")
                            .padding()
                            .background(.blue)
                            .clipShape(Circle())
                        VStack {
                            HStack {
                                Text("Coffee Corner")
                                    .fontWeight(.medium)
                                Spacer()
                                Text("$5.14")
                                    .fontWeight(.medium)
                            }
                            HStack {
                                Text("Mar 13, 2024 Pending")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                Spacer()
                                HStack{
                                    Image(systemName: "ev.charger")
                                        .font(.caption)
                                    Text("2%")
                                        .font(.footnote)
                                }
                                .padding(.vertical,1)
                                .padding(.horizontal,5)
                                .background(.blue.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                        .padding(5)
                    }
                }
            }
        }
        .padding()
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.height * 0.6,
            alignment: .top
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TransactionComponent(baseGeo: geometry)
    })
}
