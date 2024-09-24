//
//  WalletBodyComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 25.08.2024.
//

import SwiftUI

fileprivate enum OptionEnum {
    case send
    case receive
    case swap
    case transaction
}

fileprivate struct Option : Identifiable{
    var id : UUID = UUID()
    var image : String
    var label : String
    var option : OptionEnum
}

struct WalletBodyComponent: View {
    
    let childGeo : GeometryProxy
    @StateObject var viewModel : PortfolioViewModel
    
    @State private var selectedSheet : Option?
    @State private var options : [Option] = [
        Option(image: "arrow.up", label: "Send", option: .send),
        Option(image: "arrow.down", label: "Receive", option: .receive),
        Option(image: "arrow.left.arrow.right", label: "Swap", option: .swap),
        Option(image: "doc.text.magnifyingglass", label: "History", option: .transaction)
    ]
       
    var body: some View {
        VStack{
            HStack{
                Text("$" + String(viewModel.balance))
                    .font(.title)
                    .fontWeight(.semibold)
                    .blur(radius: viewModel.isHidedBalance ? 6 : 0)
                Spacer()
            }
            HStack{
                ForEach(options){ option in
                    Spacer()
                    ButtonWithHapticFeedback{
                        selectedSheet = option
                    } label: {
                        VStack{
                            Image(systemName: option.image)
                                .padding()
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .background(.gray.opacity(0.25))
                                .clipShape(Circle())
                            Text(option.label)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    .tint(.white)
                    Spacer()
                }
            }
        }
        .frame(
            width: childGeo.size.width,
            height: childGeo.size.height * 0.85
        )
        .sheet(item: $selectedSheet) { selected in
            switch selected.option {
            case .send:
                SendSheetView(viewModel: viewModel)
            case .swap:
                SwapSheetView()
            case .receive:
                ReceiveSheetView(viewModel: viewModel)
            case .transaction:
                TransactionSheetView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    GeometryReader { geo in
        WalletBodyComponent(
            childGeo: geo,
            viewModel: PortfolioViewModel()
        )
    }
}
