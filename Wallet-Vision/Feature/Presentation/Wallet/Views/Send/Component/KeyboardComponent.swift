//
//  KeyboardComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.08.2024.
//

import SwiftUI

struct KeyboardComponent: View {
    
    let baseGeo : GeometryProxy
    let items = ["1","2","3","4","5","6","7","8","9"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
            ForEach(chunks(of: items, chunkSize: 3), id: \.self) { chunk in
                HStack{
                    ForEach(chunk, id: \.self) { item in
                        ButtonWithHapticFeedback {
                            
                        } label: {
                            Text("\(item)")
                                .font(.title)
                                .padding(.vertical)
                                .fontWeight(.semibold)
                                .frame(width: baseGeo.size.width * 0.33)
                        }
                        .tint(.white)
                    }
                }
            }
            HStack(){
                ButtonWithHapticFeedback {
                    
                } label: {
                    Text(".")
                        .font(.title)
                        .padding(.bottom)
                        .fontWeight(.heavy)
                        .frame(width: baseGeo.size.width * 0.33)
                }
                .tint(.white)
            
                ButtonWithHapticFeedback {
                    
                } label: {
                    Text("0")
                        .font(.title)
                        .padding(.vertical)
                        .fontWeight(.semibold)
                        .frame(width: baseGeo.size.width * 0.33)
                }
                .tint(.white)
                
                ButtonWithHapticFeedback {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .padding(.vertical)
                        .fontWeight(.semibold)
                        .frame(width: baseGeo.size.width * 0.33)
                }
                .tint(.white)
            }
            HStack{
                ButtonWithHapticFeedback {
                    
                } label: {
                    Text("Receive")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: baseGeo.size.width * 0.45)
                        .background(.gray.opacity(0.3))
                        .clipShape(Capsule())
                }
                .tint(.white)
                
                Spacer()
                
                ButtonWithHapticFeedback {
                    
                } label: {
                    Text("Send")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: baseGeo.size.width * 0.45)
                        .background(.blue)
                        .clipShape(Capsule())
                }
                .tint(.black)
            }
            .padding()
        }
        .frame(
            width: baseGeo.size.width,
            height: baseGeo.size.height * 0.5
        )
    }
    
    func chunks<T>(of array: [T], chunkSize: Int) -> [[T]] {
        return stride(from: 0, to: array.count, by: chunkSize).map {
            Array(array[$0..<min($0 + chunkSize, array.count)])
        }
    }
    
}

#Preview {
    GeometryReader(content: { geometry in
        KeyboardComponent(baseGeo: geometry)
    })
}
