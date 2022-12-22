//
//  SubDataDetail.swift
//  sub
//
//  Created by Mateusz on 17/12/2022.
//

import SwiftUI

struct SubDataDetail: View {
    var creatingNew: Bool
    @Binding var subData: subscriptionData  // Main onscreen data about sub
    @Environment(\.colorScheme) var colorScheme
    @Binding var subArr: [subscriptionData]
    //NOTIFICATION MENAGER
    @EnvironmentObject var lnMenager: localNotificationMenager
    //TRIGGERS
    @Binding var showSheet: Bool    // Show sheet trigger
    @Binding var deleteActionTrigger: Bool  // Delete trigger
    @State var isPresentingConfirm: Bool = false // Delete confirmation trigger
    
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
                                if (creatingNew)
                                {
                                    subArr.append(subData)  //Append new entry to array
                                }
                                lnMenager.removeRequest(withId: subData.subName)    // Remove notification request
                                if (subData.notificationEnabled == true)    //If toggle for notification is enabled
                                {
                                    var dateComponentsEndOfSub: DateComponents  //Seting var
                                    
                                    if (subData.monthly) {
                                        dateComponentsEndOfSub = Calendar.current.dateComponents([.day, .hour, .minute], from:                                     Calendar.current.date(byAdding: .day, value: subData.reminderDelay, to: subData.subEndDate)!)   //Set notification date for monthly
                                    }
                                    else
                                    {
                                        dateComponentsEndOfSub = Calendar.current.dateComponents([.month, .day, .hour, .minute], from:                                     Calendar.current.date(byAdding: .day, value: subData.reminderDelay, to: subData.subEndDate)!)   //Set notification date for yeealy
                                    }
                                    
                                    lnMenager.schedule(localNotification: localNotification(identifier: subData.subName, title: "\(subData.subName) reminder", body: "Your \(subData.subName) subscription is ending soon", dateComponents: dateComponentsEndOfSub, repeats: true))    //Schedule notifiaction
                                    
                                    print (dateComponentsEndOfSub)  //Debug for notification
                                }
                                showSheet = false   //Hide Sheet
                            } label: {
                                Text(creatingNew ? "Add" : "Save")  //When adding change text to add
                            }
                        }
                    }
                    .navigationBarTitle(creatingNew ? "Track New Subscription" : "Edit Subscripiton Details", displayMode: .inline)
                Divider()
                ImageBox(iconName: subData.subName) //Image box
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
                    }
                    .task {
                        try? await lnMenager.requestAuth()
                    }
                    if subData.notificationEnabled {
                        DatePicker("Time of notification", selection: $subData.subEndDate, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.compact)
                        Picker(selection: $subData.reminderDelay, label: Text("Remind me")) {
                            Text("Same day").tag(0)
                            Text("Day before").tag(1)
                            Text("2 days before").tag(2)
                            Text("3 days before").tag(3)
                            Text("Week before").tag(4)
                        }
                        .pickerStyle(.automatic)
                    }
                    if (!creatingNew) { //If creating new sub entry disable delate button
                        Section
                        {
                            Button {
                                isPresentingConfirm.toggle()
                            } label: {
                                HStack
                                {
                                    Spacer()
                                    Text("Delete")
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                            }
                            .confirmationDialog("Are you sure you want to delete subscription?", isPresented: $isPresentingConfirm, titleVisibility: .visible) {
                                Button(role: .destructive) {
                                    lnMenager.removeRequest(withId: subData.subName)
                                    showSheet = false
                                    deleteActionTrigger = true
                                    subData.flagedToDelete = true
                                } label: {
                                    Text("Delete")
                                }
                            }
                        }
                    }
                }
                .listStyle(.automatic)
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)  //If bg tapped dismiss keyboard
            }
        }
    }
}


struct SubDataDetail_Previews: PreviewProvider {
    @State static var subDataPreview: subscriptionData = subscriptionData(subName: "Netflix", subPirce: 20.3, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true, subCategory: "TV", notificationEnabled: true, reminderDelay: 0)
    @State static var showSheet: Bool = true
    @State static var delActionTrig: Bool = false
    @State static var createNew: Bool = false
    @State static var arrrr: [subscriptionData] = [subscriptionData(subName: "Netflix", subPirce: 20.3, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true, subCategory: "TV", notificationEnabled: true, reminderDelay: 0)]
    
    static var previews: some View {
        SubDataDetail(creatingNew: false, subData: $subDataPreview, subArr: $arrrr, showSheet: $showSheet, deleteActionTrigger: $delActionTrig)
            .environmentObject(localNotificationMenager())
    }
}
