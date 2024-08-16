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
            GeometryReader{geo in
                
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
