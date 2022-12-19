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
    @State public var subscriptions: [subscriptionData] = subscriptionList.hardCodedDefults
    @State var delateActionTriggered: Bool = false
    
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
                    ForEach(subscriptions.indices, id: \.self) { sub in
                        SubscriptionRow(subData: $subscriptions[sub], delateActionTriggered: $delateActionTriggered)
                    }
                }
                .onChange(of: delateActionTriggered, perform: { newValue in
                    for index in subscriptions.indices
                    {
                        if(subscriptions[index].flagedToDelete)
                        {
                            subscriptions.remove(at: index)
                            delateActionTriggered = false
                            return
                        }
                    }
                })
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
            .environmentObject(localNotificationMenager())
    }
}
