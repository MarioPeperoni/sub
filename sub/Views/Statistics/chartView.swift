//
//  chartView.swift
//  sub
//
//  Created by Mateusz on 02/01/2023.
//

import SwiftUI
import SwiftUICharts

struct chartView: View {
    var demoData: [Double] = [Double.random(in: 1...15), Double.random(in: 1...15), Double.random(in: 1...15), Double.random(in: 1...15), Double.random(in: 1...15), Double.random(in: 1...15), Double.random(in: 1...15)]
    var body: some View {
        VStack
        {
            BarChart()
                .data(demoData)
                .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .purple)))
        }
    }
}

struct chartView_Previews: PreviewProvider {
    static var previews: some View {
        chartView()
    }
}
