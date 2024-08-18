//
//  TransferView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 17.08.2024.
//

import SwiftUI

struct BrowserView: View {
    
    @StateObject var viewModel : BrowserViewModel
    
    var body: some View {
        NavigationStack{
            Text("Browser View")
        }
    }
}

#Preview {
    BrowserView(viewModel: BrowserViewModel())
}
