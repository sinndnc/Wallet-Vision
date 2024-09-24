//
//  ChartGraphicComponent.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 1.09.2024.
//

import SwiftUI
import Charts

struct ChartGraphic: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var value: Double
    
    init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
}

func generateDailyChartData(forLastMonths months: Int) -> [ChartGraphic] {
    var data = [ChartGraphic]()
    var currentDate : Date = .now
    
    var dateComponents = DateComponents()
    dateComponents.month = -months
    dateComponents.minute = -currentDate.minute
    
    let startDate = Calendar.current.date(byAdding: dateComponents, to: currentDate)!
    currentDate = Calendar.current.date(byAdding: .minute, value: -currentDate.minute,to: currentDate)!
    
    var date = startDate
    while date <= currentDate {
        let randomValue = Double.random(in: 100...200)
        
        data.append(ChartGraphic(date: date, value: randomValue))
        date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
    }
    
    return data
}



struct ChartGraphicComponent: View {
    
    let token : TokenUI
    let baseGeo : GeometryProxy
    
    @State private var selectedPrice: ChartGraphic?
    @State private var tokenHistory: [ChartGraphic] = generateDailyChartData(forLastMonths: 1)
    @State private var currentTab : String = "1 Month"
    
    var body: some View {
        ZStack(alignment: .top){
            RadialGradient(
                colors: [
                    .blue.opacity(0.75),
                    .clear
                ],
                center: .top,
                startRadius: 0,
                endRadius: baseGeo.size.height * 0.35
            )
            .ignoresSafeArea()
            
            VStack(alignment: .center){
                VStack(spacing: 10){
                    Image(token.symbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65,height: 65)
                    Text(token.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if let selectedPrice = selectedPrice{
                        
                        Text("$\(selectedPrice.value,specifier: "%.3f")")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        HStack {
                            
                            let balance = tokenHistory.last!.value - selectedPrice.value
                            Text("\(balance > 0 ? "+" : "")\(balance,specifier: "%.3f")")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundStyle(balance > 0 ? .green : .red)
                            
                            
                            HStack(spacing: 1){
                                
                                Image(systemName: "\(balance > 0 ? "arrow.up" : "arrow.down")")
                                    .font(.caption2)
                                    .fontWeight(.medium)
                                    .foregroundStyle(balance > 0 ? .green : .red)
                                
                                Text("\(balance > 0 ? "+" : "")\(balance,specifier: "%.2f")%")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .foregroundStyle(balance > 0 ? .green : .red)
                            }
                        }
                    }else{
                        Text("$\(tokenHistory.last!.value,specifier: "%.3f")")
                            .font(.title)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 10) {
                            let balance = tokenHistory.last!.value - tokenHistory.first!.value
                            
                            Text("\(balance > 0 ? "+" : "")\(balance,specifier: "%.3f")")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundStyle(balance > 0 ? .green : .red)
                            
                            
                            HStack(spacing: 1){
                                Image(systemName: "\(balance > 0 ? "arrow.up" : "arrow.down")")
                                    .font(.caption2)
                                    .fontWeight(.medium)
                                    .foregroundStyle(balance > 0 ? .green : .red)
                                
                                Text("\(balance > 0 ? "+" : "")\(balance,specifier: "%.2f")%")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .foregroundStyle(balance > 0 ? .green : .red)
                            }
                        }
                    }
                }
                
                Chart(tokenHistory) { point in
                    if let firstPrice = tokenHistory.first{
                        LineMark(
                            x: .value("",point.date),
                            y: .value("",point.value)
                        )
                        .interpolationMethod(.stepStart)
                        .lineStyle(StrokeStyle(lineWidth: 1))
                        
                        RuleMark(y: .value("Limit", firstPrice.value))
                            .foregroundStyle(.white)
                            .lineStyle(StrokeStyle(lineWidth:0.5))
                        
                        let selectSide = firstPrice.value < point.value
                        AreaMark(
                            x: .value("",point.date),
                            yStart: .value("", selectSide ? point.value : firstPrice.value),
                            yEnd: .value("", !selectSide ? point.value : firstPrice.value)
                        )
                        .interpolationMethod(.stepStart)
                        .foregroundStyle(.blue.opacity(0.2))
                    }
                    
                    if let selectedPoint = selectedPrice {
                        RuleMark(
                            x: .value("", selectedPoint.date)
                        )
                        .foregroundStyle(.white)
                        .lineStyle(StrokeStyle(lineWidth: 1))
                        
                        PointMark(
                            x: .value("Selected Date", selectedPoint.date),
                            y: .value("Selected Value", selectedPoint.value)
                        )
                        .foregroundStyle(.white)
                    }
                }
                .padding()
                .frame(height: baseGeo.size.height * 0.4)
                .chartOverlay { chartProxy in
                    GeometryReader{ geometry in
                        Rectangle()
                            .fill(.clear)
                            .contentShape(Rectangle())
                            .gesture(DragGesture()
                                .onChanged{ value in
                                    
                                    let origin = geometry[chartProxy.plotFrame!].origin
                                    let location = CGPoint(
                                        x: value.location.x - origin.x,
                                        y: value.location.y - origin.y
                                    )
                                    
                                    if let date : Date = chartProxy.value(atX: location.x){
                                        
                                        if let selectedPrice = tokenHistory.first(where: { item in
                                            item.date.day == date.day && item.date.month == date.month
                                        }){
                                            self.selectedPrice = selectedPrice
                                        }
                                    }
                                    
                                }
                                .onEnded{ value in
                                    self.selectedPrice = nil
                                }
                            )
                    }
                }
                .chartYScale(domain: [90, 205])
                .chartYAxis{
                    AxisMarks(
                        preset: .aligned,
                        position: .leading
                    ) { value in
                        AxisValueLabel()
                    }
                }
                .chartXAxis{
                    AxisMarks(
                        preset: .aligned,
                        position: .bottom
                    ) { value in
                        AxisValueLabel()
                    }
                }
                
                HStack{
                    Text("Market value: $2,234,324.59")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Spacer()
                    if let selectedPrice = selectedPrice{
                        Text("\(selectedPrice.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                    }else{
                        Text("\(tokenHistory.last!.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal)

                Picker("",selection: $currentTab) {
                    Text("1 Day")
                        .tag("1 Day")
                    Text("1 Week")
                        .tag("1 Week")
                    Text("1 Month")
                        .tag("1 Month")
                    Text("3 Months")
                        .tag("3 Months")
                    Text("6 Months")
                        .tag("6 Months")
                    Text("Year to Now")
                        .tag("Year to Now")
                }
                .padding(.horizontal)
                .colorMultiply(.blue)
                .pickerStyle(.segmented)
            }
        }
        .frame(height: baseGeo.size.height * 0.7)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        ChartGraphicComponent(
            token: TokenUI(name: "ETH", symbol: "", network: TestNetworks.sepolia, longName: "", value: .zero, amount: .zero, UnitPrice: .zero), 
            baseGeo: geometry
        )
    })
}
