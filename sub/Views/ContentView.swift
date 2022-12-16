//
//  ContentView.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var swich: Bool = true
    
    var subscriptions: [subscriptionData] = subscriptionList.hardCodedDefults
    
    var body: some View {
        VStack() {
            HStack {
                Text("Hello Walter White!")
                    .font(.system(size: 36))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .padding()
                Spacer()
                UserIcon()
                    .padding()
            }
            ScrollView() {
                CardBar()
                Divider()
                VStack(spacing: -20) {
                    ForEach(subscriptions, id: \.id) { sub in
                        SubscriptionRow(subName: sub.subName, subPrice: sub.subPirce, subEndDate: sub.subEndDate, subActive: sub.subActive, subDesc: sub.subDesc, subCategory: sub.subCategory)
                    }
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            AddNewSubPlusButton()
                .padding()
                .offset(x: -30, y: -10)
                .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
