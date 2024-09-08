//
//  SwapTokenPreviewComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI

struct SwapTokenPreviewComponent: View {
    
    let geo : GeometryProxy
    
    var body: some View {
        ZStack{
            VStack{
                VStack(alignment: .leading){
                    Text("You send")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    HStack{
                        Text("10,000.00")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "checkmark")
                            .padding()
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    HStack{
                        Image(systemName: "doc")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text("29,296.94")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height * 0.2
                )
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                
                VStack(alignment: .leading){
                    Text("You receive")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    HStack{
                        Text("250,239.35")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "checkmark")
                            .padding()
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    HStack{
                        Image(systemName: "doc")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text("0.00")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height * 0.2
                )
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            ButtonWithHapticFeedback {
                
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .padding(10)
                    .background(.background)
                    .clipShape(Circle())
            }
            .tint(.white)
        }
        .frame(
            width: geo.size.width,
            height: geo.size.height * 0.4
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        SwapTokenPreviewComponent(geo: geometry)
    })
}
