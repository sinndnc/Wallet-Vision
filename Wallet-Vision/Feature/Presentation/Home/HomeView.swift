//
//  Home View.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                Button(action: {
                    viewModel.nfcService.beginScanning()
                }, label: {
                    Text("Button")
                })
                .navigationTitle("Home")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
