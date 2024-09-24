//
//  TokenView.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 31.08.2024.
//

import SwiftUI
import Charts
import Foundation

struct TokenGraphic: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var value: Double
    
    init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
}


func generateDailyData(forLastMonths months: Int) -> [TokenGraphic] {
    var data = [TokenGraphic]()
    let calendar = Calendar.current
    let currentDate = Date()
    let startDate = calendar.date(byAdding: .month, value: -months, to: currentDate)!
    
    var date = startDate
    while date <= currentDate {
        let randomValue = Double.random(in: 10...100)
        data.append(TokenGraphic(date: date, value: randomValue))
        date = calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    return data
}


struct TokenView: View {
    
    let token : TokenUI
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                VStack{
                    ChartGraphicComponent(
                        token: token,
                        baseGeo: geo
                    )
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}, label: {
                            Image(systemName:"bell")
                                .font(.subheadline)
                        })
                        .tint(.white)
                    }
                }
            }
        }
    }
}



#Preview {
    GeometryReader(content: { geometry in
        TokenView(token : TokenUI(name: "ETH", symbol: "", network: TestNetworks.sepolia, longName: "", value: .zero, amount: .zero, UnitPrice: .zero))
    })
}
