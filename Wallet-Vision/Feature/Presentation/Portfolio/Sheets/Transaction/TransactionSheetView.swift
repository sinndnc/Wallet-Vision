//
//  BuyAndSellView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 30.08.2024.
//

import SwiftUI

struct TransactionSheetView: View {
    
    @StateObject var viewModel : PortfolioViewModel
    
    var body: some View {
        NavigationStack{
            List(viewModel.transactionHistory,id: \.self) { transaction in
                HStack{
                    Image(systemName:  "arrow.up")
                        .padding()
                        .font(.title3)
                        .background(.gray)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        Text("Transfer")
                        HStack{
                            Text("To:\(transaction.to)")
                                .lineLimit(1)
                                .truncationMode(.middle)
                            Spacer()
                            Text(String(transaction.value))
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
//            await viewModel.fetchTransactions(for: "0xd7cd47a36e52772a068b13d59bcc80ede4e8d3bf")
        }
    }
}

#Preview {
    TransactionSheetView(viewModel: PortfolioViewModel())
}
