//
//  RootView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import SwiftUI

fileprivate enum TabEnum { case home ; case card ; case portfolio ; case transfer}

struct RootView: View {
    
    @State private var selectedTab : TabEnum = .portfolio
    @StateObject private var viewModel : RootViewModel = RootViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView(viewModel: HomeViewModel())
                .tabview(tag: .home, text: "Home", image: "house")
            BrowserView(viewModel: BrowserViewModel())
                .tabview(tag: .transfer, text: "Browser", image: "globe")
            CardView(viewModel: CardViewModel())
                .tabview(tag: .card, text: "Card", image: "creditcard")
            PortfolioView()
                .tabview(tag: .portfolio, text: "Portfolio", image: "briefcase")
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
        Binding {
            return self.selectedTab
        }
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
                Label { Text(text) } icon: { Image(systemName: image) }
                    .font(.caption)
            }
    }
}



#Preview {
    RootView()
}
