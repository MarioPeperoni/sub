//
//  ContentView.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var swich: Bool = true
    @EnvironmentObject var lnMenager: localNotificationMenager
    @State public var subscriptions: [subscriptionData] = decode()
    //ACTION TRIGGERS
    @State var delateActionTriggered: Bool = false
    @State var showStatSheet: Bool = false
    
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
                Button {
                    showStatSheet = true
                } label: {
                    CardBar()
                }
                .sheet(isPresented: $showStatSheet) {
                    mainStatView(subData: subscriptions)
                        .presentationDetents([.fraction(0.75), .large])
                }
                Divider()
                VStack(spacing: -20) {
                    ForEach(subscriptions.indices, id: \.self) { sub in
                        SubscriptionRow(subData: $subscriptions[sub], delateActionTrigger: $delateActionTriggered, subArr: $subscriptions)
                    }
                }
                .onChange(of: subscriptions) { newValue in
                    encode(subsciptionDataPassed: subscriptions)
                }
                .onChange(of: delateActionTriggered) { newValue in
                    for index in subscriptions.indices
                    {
                        if(subscriptions[index].flagedToDelete)
                        {
                            subscriptions.remove(at: index)
                            delateActionTriggered = false
                            return
                        }
                    }
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            AddNewSubPlusButton(subscriptionArr: $subscriptions)
                .padding()
                .offset(x: -30, y: -10)
                .shadow(radius: 20)
        }
        .onAppear   //Run if app opens
        {
            UIApplication.shared.applicationIconBadgeNumber = 0 //Clear notification badges
            for index in subscriptions.indices {    //Check if date passed and update it
                if (subscriptions[index].subEndDate < Date())
                {
                    if(subscriptions[index].monthly)    //If monthly renewal
                    {
                        subscriptions[index].subEndDate = Calendar.current.date(byAdding: .month, value: 1, to: subscriptions[index].subEndDate)!
                    }
                    else    //If yearly renewal
                    {
                        subscriptions[index].subEndDate = Calendar.current.date(byAdding: .year, value: 1, to: subscriptions[index].subEndDate)!
                    }
                    subscriptions[index].familyDataList[0].pricePaying += subscriptions[index].subPirce
                }
            }
        }
    }
}
