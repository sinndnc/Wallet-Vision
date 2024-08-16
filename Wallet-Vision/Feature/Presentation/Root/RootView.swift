//
//  RootView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

fileprivate enum TabEnum { case home ; case wallet }

struct RootView: View {
    
    @State private var selectedTab : TabEnum = .wallet
    @StateObject private var viewModel : RootViewModel = RootViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView(viewModel: HomeViewModel())
                .tabview(tag: .home, text: "Home", image: "house")
            WalletView(viewModel: WalletViewModel())
                .tabview(tag: .wallet, text: "Wallet", image: "wallet.pass")
        }
        .navigationBarBackButtonHidden()
    }
}

fileprivate extension View {
    func tabview(tag: TabEnum,text: String,image : String) -> some View {
        modifier(tabViewModifier(tag: tag, text: text,image: image))
    }
}

fileprivate extension RootView {
    private func tabSelection() -> Binding<TabEnum> {
        Binding { self.selectedTab }
        set: { tappedTab in
            if tappedTab == self.selectedTab {}
            self.selectedTab = tappedTab
        }
    }
}

fileprivate struct tabViewModifier : ViewModifier {
    
    let tag : TabEnum
    let text : String
    let image : String
    
    func body(content: Content) -> some View {
        content
            .tag(tag)
            .tabItem {
                Label(LocalizedStringKey(text), systemImage: image)
            }
    }
}



#Preview {
    RootView()
}
