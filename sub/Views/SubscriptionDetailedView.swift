//
//  SubscriptionDetailedView.swift
//  sub
//
//  Created by Mateusz on 16/12/2022.
//

import SwiftUI

struct SubscriptionDetailedView: View {
    
    let subData: subscriptionData
    
    var body: some View {
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MMM-yyyy"
            return formatter
        }()
        
        VStack {
            Image(subData.subName + "_Icon")
                .resizable()
                .frame(width: 50, height: 50)
            Text(subData.subName)
            Text(String(subData.subPirce))
            Text(dateFormatter.string(from: subData.subEndDate))
            Text(String(subData.subActive))
            Text(subData.subDesc)
            Text(subData.subCategory)
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SubscriptionDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionDetailedView(subData: subscriptionData(subName: "Netflix", subPirce: 43.00, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true, subDesc: "Lorem ipsum", subCategory: "TV"))
    }
}
