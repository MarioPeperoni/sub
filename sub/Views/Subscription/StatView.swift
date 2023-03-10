//
//  StatView.swift
//  sub
//
//  Created by Mateusz on 23/12/2022.
//

import SwiftUI

struct StatView: View {
    
    @Binding var subData: subscriptionData
    
    @Binding var showStatSheet: Bool
    @Binding var showEditSheet: Bool
    
    //Alert variables
    @State var showAlert: Bool = false
    @State var newNameTemp: String = ""
    @State var newPriceTemp: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack
                {
                    Spacer()
                    StatElement(statTypeID: 1, value: subData.spend, big: true)
                    Spacer()
                }
                .toolbar()
                {
                    ToolbarItem
                    {
                        Button {
                            showStatSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showEditSheet = true
                            }   //Dispatch fixes animation
                        } label: {
                            Text("Edit")
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                        }
                        
                    }
                }
                .padding(20)
                Text("Days to next payment: \(calculateDays(subscriptionDate: subData.subEndDate)) days")
                    .font(.callout)
                
                ProgressView(value: 1 - Double(calculateDays(subscriptionDate: subData.subEndDate)) / (subData.monthly ? 30.0 : 365.0))
                    .padding(.horizontal)
                VStack{
                    NavigationLink {
                        CardCreationScreen(subData: $subData)
                            .navigationTitle("My Virtual Card")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        BigGradientButton(gradientColor1: .accentColor, gradientColor2: .purple, textShowing: "Setup Your Virtual Card", imageName: "creditcard.fill", stroke: false)
                            .padding(.bottom, 5)
                    }
                    if(subData.familyDataList.count != 1)
                    {
                        FamilyPaymentView(familyDataArray: $subData.familyDataList, subPrice: subData.subPirce)
                            .overlay
                        {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 6)
                                .fill(LinearGradient(gradient: Gradient(colors: [.accentColor, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }
                    }
                    else
                    {
                        Button {
                            showAlert = true
                        } label: {
                            BigGradientButton(gradientColor1: .accentColor, gradientColor2: .green, textShowing: "Enable Family Share!", imageName: "person.line.dotted.person.fill", stroke: false)
                                .padding(.bottom, 5)
                        }
                        .alert("Family Share", isPresented: $showAlert, actions: {
                            
                            TextField("Name", text: $newNameTemp)
                                .textContentType(.name)
                                .autocorrectionDisabled()
                            Button("Add", action: {
                                subData.familyDataList.append(familyData(personName: newNameTemp, hasAvatar: false, pricePaying: Double(newPriceTemp) ?? 0, fixedPrice: false))
                                splitprices()
                                clearTempVars()
                            })
                            Button("Cancel", role: .cancel, action: {
                                clearTempVars()
                            })
                            
                        }) {
                            Text("Add new family member")
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
    func clearTempVars()
    {
        newNameTemp = ""
        newPriceTemp = ""
    }
    func splitprices()
    {
        let priceForSubSplitted: Double = subData.subPirce / Double(subData.familyDataList.count)
        for index in subData.familyDataList.indices
        {
            subData.familyDataList[index].pricePaying = priceForSubSplitted
        }
    }
}

struct StatView_Previews: PreviewProvider {
    @State static var subDataPreview: subscriptionData = subscriptionData(subName: "Netflix", subPirce: 43.00, subEndDate: Date(timeIntervalSince1970: 1672158303), subActive: true, subCategory: "TV", notificationEnabled: false, reminderDelay: 0)
    @State static var showStatSheetPreview = true
    @State static var showEditSheetPreview = false
    
    static var previews: some View {
        StatView(subData: $subDataPreview, showStatSheet: $showStatSheetPreview, showEditSheet: $showEditSheetPreview)
    }
}

func calculateDays(subscriptionDate: Date) -> Int
{
    let date1 = Calendar.current.startOfDay(for: Date())
    let date2 = Calendar.current.startOfDay(for: subscriptionDate)
    let components = Calendar.current.dateComponents([.day], from: date1, to: date2)
    return components.day!
}
