//
//  SubDataDetail.swift
//  sub
//
//  Created by Mateusz on 17/12/2022.
//

import SwiftUI

struct SubDataDetail: View {
    
    @Binding var subData: subscriptionData
    @Binding var showSheet: Bool
    @Binding var deleteActionTrigger: Bool
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var lnMenager: localNotificationMenager
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .toolbar {
                        ToolbarItem {
                            Button {
                                lnMenager.removeRequest(withId: subData.subName)
                                if (subData.notificationEnabled == true)
                                {
                                    
                                    var dateComponentAdd = DateComponents()
                                    dateComponentAdd.day = subData.reminderDelay
                                    
                                    let dateComponentsEndOfSub = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: subData.subEndDate)
                                    
                                    lnMenager.schedule(localNotification: localNotification(identifier: subData.subName, title: "\(subData.subName) reminder", body: "Your \(subData.subName) subscription is ending soon", dateComponents: dateComponentsEndOfSub, repeats: false))
                                    
                                    print (dateComponentsEndOfSub)
                                }
                                showSheet = false   //Hide Sheet
                            } label: {
                                Text("Save")
                            }
                        }
                    }
                    .navigationBarTitle("Edit Subscripiton Details", displayMode: .inline)
                Divider()
                ImageBox(iconName: subData.subName)
                    .padding()
                List {
                    Section(header: Text("Information")) {
                        TextField("Name of subscription", text: $subData.subName)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                        Picker(selection: $subData.subCategory, label: Text("Category")) {
                            Text("TV").tag("TV")
                            Text("Music").tag("Music")
                            Text("Shopping").tag("Shopping")
                            Text("Games").tag("Games")
                            Text("Other").tag("Other")
                        }
                        .pickerStyle(.menu)
                        Toggle(isOn: $subData.subActive) {
                            Text("Auto renew")
                        }
                        
                    }
                    Section(header: Text("Payment"))
                    {
                        HStack {    //Subscription price button
                            Text("Subscription price ")
                            Spacer()
                            HStack
                            {
                                TextField("Price", value: $subData.subPirce, format: .number)
                                    .disableAutocorrection(true)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.center)
                                Text("PLN")
                                    .offset(x:-5)
                                    .padding(.trailing, 6)
                            }
                            .background()
                            {
                                Rectangle()
                                    .frame(height: 30)
                                    .foregroundColor(Color("SelectionColor"))
                                    .cornerRadius(7)
                            }
                            .padding(.leading, 50)
                            
                        }
                        
                        Picker(selection: $subData.monthly, label: Text("Type of subcription")) {
                            Text("Monthly").tag(true)
                            Text("Yearly").tag(false)
                        }
                        .pickerStyle(.menu)
                        
                        DatePicker("Next renew date", selection: $subData.subEndDate, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                        
                    }
                    Section(header: Text("Notfications"))
                    {
                        Toggle(isOn: $subData.notificationEnabled) {
                            Text("Enable notfications")
                        }
                        .onChange(of: subData.notificationEnabled, perform: { newValue in
                            if (subData.notificationEnabled == true)
                            {
                                
                                var dateComponentAdd = DateComponents()
                                dateComponentAdd.day = subData.reminderDelay
                                
                                let dateComponentsEndOfSub = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: subData.subEndDate)
                                
                                lnMenager.schedule(localNotification: localNotification(identifier: subData.subName, title: "\(subData.subName) reminder", body: "Your \(subData.subName) subscription is ending soon", dateComponents: dateComponentsEndOfSub, repeats: false))
                                
                                print (dateComponentsEndOfSub)
                            }
                            if (subData.notificationEnabled == false)
                            {
                                lnMenager.removeRequest(withId: subData.subName)
                            }
                            
                        })
                        .task {
                            try? await lnMenager.requestAuth()
                        }
                        if subData.notificationEnabled {
                            DatePicker("Time of notification", selection: $subData.subEndDate, displayedComponents: [.hourAndMinute])
                                .datePickerStyle(.compact)
                            Picker(selection: .constant(1), label: Text("Remind me")) {
                                Text("Same day").tag(1)
                                Text("Day before").tag(2)
                                Text("2 days before").tag(3)
                                Text("3 days before").tag(3)
                                Text("Week before").tag(3)
                            }
                            .pickerStyle(.automatic)
                        }
                    }
                    Section
                    {
                        Button {
                            lnMenager.removeRequest(withId: subData.subName)    //Delete notification if exists
                            showSheet = false
                            deleteActionTrigger = true
                            subData.flagedToDelete = true
                        } label: {
                            HStack
                            {
                                Spacer()
                                Text("Delete")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                }
                .listStyle(.automatic)
            }
        }
    }
}


struct SubDataDetail_Previews: PreviewProvider {
    @State static var subDataPreview: subscriptionData = subscriptionData(subName: "Netflix", subPirce: 20.3, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true, subCategory: "TV", notificationEnabled: true, reminderDelay: 0)
    @State static var showSheet: Bool = true
    @State static var delActionTrig: Bool = false
    
    static var previews: some View {
        SubDataDetail(subData: $subDataPreview, showSheet: $showSheet, deleteActionTrigger: $delActionTrig)
            .environmentObject(localNotificationMenager())
    }
}
