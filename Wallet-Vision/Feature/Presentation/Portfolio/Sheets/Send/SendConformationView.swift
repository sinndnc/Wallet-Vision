//
//  SendConformationView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 9.09.2024.
//

import SwiftUI

struct SendConformationView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                List{
                    Section{
                        HStack{
                            Spacer()
                            Text("-0.00001995")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("CELO")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparatorTint(.clear)
                    Section{
                        HStack{
                            Text("Asset")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Celo (CELO)")
                                .font(.footnote)
                        }
                        HStack{
                            Text("From")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Main Wallet (0x7CD4...4e8D3Bf)")
                                .font(.footnote)
                        }
                        HStack{
                            Text("To")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("0x7CD4...4e8D3Bf")
                                .font(.footnote)
                        }
                    }
                    .listRowSeparatorTint(.clear)
                    Section{
                        HStack{
                            Text("Network Fee")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Image(systemName:"info.circle.fill")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("0.00045045 CELO")
                                .font(.footnote)
                        }
                        HStack{
                            Text("Max Total")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("$0.00")
                                .font(.footnote)
                        }
                    }
                    .listRowSeparatorTint(.clear)
                }
                Spacer()
                ButtonWithHapticFeedback {
                    
                } label: {
                    Text("Approve Transfer")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: geo.size.width * 0.9)
                        .background(.green.opacity(0.9))
                        .clipShape(Capsule())
                }
                .tint(.white)
            }
            .toolbarRole(.editor)
            .navigationTitle("Transfer")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        
                    }label: {
                        Image(systemName: "gear")
                    }
                    .tint(.white)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        SendConformationView()
    }
}
