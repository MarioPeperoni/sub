//
//  SubscriptionRow.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI


struct SubscriptionRow: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        return formatter
    }()
    
    @Binding var subData: subscriptionData
    @Binding var delateActionTriggered: Bool
    
    @State public var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet = true
        }label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: .infinity, height: 100)
                .foregroundColor(Color("BoxColor"))
                .overlay(alignment: .topLeading) {
                    HStack
                    {
                        Image("\(subData.subName)_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                            .grayscale(subData.subActive ? 0.0 : 1.0)
                            .padding()
                        Text(subData.subName)
                            .font(.title2)
                            .foregroundColor(.primary)
                        Spacer()
                        /*Image(systemName: "hand.point.up")
                         .padding()
                         .foregroundColor(.primary)*/
                    }
                    .offset(y: -7)
                }
                .overlay() {
                    VStack{
                        Divider()
                            .offset(y: 7)
                    }
                }
                .overlay(alignment: .bottomLeading) {
                    if(subData.subActive)
                    {
                        Text("Next payment: \(dateFormatter.string(from: subData.subEndDate))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    else
                    {
                        Text("End of subscription: \(dateFormatter.string(from: subData.subEndDate))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    Spacer()
                }
                .overlay(alignment: .bottomTrailing) {
                    if(subData.subActive)
                    {
                        Text(String(format: "%.f", subData.subPirce) + " zł")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                    }
                    else
                    {
                        Text(String(format: "%.f", subData.subPirce) + " zł")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                            .strikethrough()
                    }
                }
                .shadow(radius: 2)
                .padding()
        }
        .sheet(isPresented: $showSheet) {
            SubDataDetail(subData: $subData, showSheet: $showSheet, deleteActionTrigger: $delateActionTriggered)
                .presentationDetents([.large])
                .environmentObject(localNotificationMenager())
        }
    }
}

struct SubscriptionRow_Previews: PreviewProvider {
    
    @State static var subDataPreview: subscriptionData = subscriptionData(subName: "Netflix", subPirce: 43.00, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true, subCategory: "TV", notificationEnabled: false, reminderDelay: 0)
    @State static var delateActionTriggered:Bool = true
    
    static var previews: some View {
        SubscriptionRow(subData: $subDataPreview, delateActionTriggered: $delateActionTriggered)
    }
}
