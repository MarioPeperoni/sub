//
//  AddNewSubPlusButton.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct AddNewSubPlusButton: View {
    
    @State var showSheet: Bool = false
    @State var subData: subscriptionData = subscriptionData(subName: "", subPirce: 0.00, subEndDate: Date(), subActive: true, subCategory: "Other", notificationEnabled: false, reminderDelay: 0)
    @Binding var subscriptionArr: [subscriptionData]
    
    var body: some View {
        Button {
            subData = subscriptionData(subName: "", subPirce: 0.00, subEndDate: Date(), subActive: true, subCategory: "Other", notificationEnabled: false, reminderDelay: 0)
            showSheet.toggle()
        } label: {
            Circle()
                .frame(width: 50)
                .foregroundColor(.accentColor)
                .overlay {
                    Image(systemName: "plus")
                        .foregroundColor(Color("BoxColor"))
                        .imageScale(.large)
                        .fontWeight(.bold)
                }
        }
        .sheet(isPresented: $showSheet) {
            SubDataDetail(creatingNew: true, subData: $subData, subArr: $subscriptionArr, showSheet: $showSheet, deleteActionTrigger: .constant(false))
                .presentationDetents([.large])
                .environmentObject(localNotificationMenager())
        }
    }
}
