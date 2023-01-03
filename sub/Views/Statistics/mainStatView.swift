//
//  mainStatView.swift
//  sub
//
//  Created by Mateusz on 02/01/2023.
//

import SwiftUI
import SwiftUICharts
import SwiftPieChart
import ColorKit

struct mainStatView: View {
    init(subData: [subscriptionData])
    {
        self.subData = subData
        for i in 0..<subData.count
        {
            let averageColor = try? UIImage(named: subData[i].subName + "_Icon")?.dominantColors()
            colorArray.append(Color(averageColor![1]))
        }
    }
    
    var colorArray: [Color] = []
    
    let subData: [subscriptionData]

    @State var chartData: [Double] = []
    
    var body: some View {
        
        VStack{
            Text("Sub overview")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .padding(.top)
            PieChartView(values: subData.map({$0.subPirce}), names: subData.map({$0.subName}), formatter: {value in String(format: "%.2fzł", value)}, colors: colorArray, backgroundColor: Color("ListBgColor"))
                .padding(20)
        }
    }
}

struct mainStatView_Previews: PreviewProvider {
    
    @State static var list: [subscriptionData] = [
        subscriptionData(subName: "Netflix",
                         subPirce: 43.00,
                         subEndDate: Date().advanced(by: TimeInterval(2592000)),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Spotify",
                         subPirce: 19.99,
                         subEndDate: Date().advanced(by: TimeInterval(424200)),
                         subActive: true,
                         subCategory: "Music",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "iCloud",
                         subPirce: 12.99,
                         subEndDate: Date().advanced(by: TimeInterval(43200)),
                         subActive: false,
                         subCategory: "Other",
                         notificationEnabled: false,
                         reminderDelay: 0)]
    
    static var previews: some View {
        mainStatView(subData: list)
    }
}
