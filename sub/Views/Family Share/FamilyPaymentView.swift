//
//  FamilyPaymentView.swift
//  sub
//
//  Created by Mateusz on 25/12/2022.
//

import SwiftUI

struct FamilyPaymentView: View {
    
    @Binding var familyDataArray: [familyData]
    
    //Alert variables
    @State var showing: Bool = false
    @State var newNameTemp: String = ""
    @State var newPriceTemp: String = ""
    
    var subPrice: Double
    
    var body: some View {
        NavigationView {
            List{
                ForEach(familyDataArray, id: \.id) { familyOne in
                    FamilyRow(familyData: familyOne)
                        .deleteDisabled(familyOne.personName == "Me")
                } .onDelete { IndexSet in
                    familyDataArray.remove(atOffsets: IndexSet)
                    splitprices()
                }
            }
            .offset(y:-30)
            .toolbar()
            {
                ToolbarItem
                {
                    Button {
                        showing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .alert("Family Share", isPresented: $showing, actions: {
                        
                        TextField("Name", text: $newNameTemp)
                            .textContentType(.name)
                            .autocorrectionDisabled()
                        /*TextField("Price", text: $newPriceTemp)
                            .textSelection(.disabled)
                            .keyboardType(.decimalPad)*/
                        Button("Add", action: {
                            familyDataArray.append(familyData(personName: newNameTemp, hasAvatar: false, pricePaying: Double(newPriceTemp) ?? 0, fixedPrice: false))
                            splitprices()
                            clearTempVars()
                        })
                        Button("Cancel", role: .cancel, action: {
                            clearTempVars()
                        })

                    }) {
                        Text("Add new family member")
                    }
                    .task {
                        clearTempVars()
                    }
                }
            }
            .navigationTitle(Text("Family Share"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func clearTempVars()
    {
        newNameTemp = ""
        newPriceTemp = ""
    }
    func splitprices()
    {
        let priceForSubSplitted: Double = subPrice / Double(familyDataArray.count)
        for index in familyDataArray.indices
        {
            familyDataArray[index].pricePaying = priceForSubSplitted
        }
    }

}

struct FamilyPaymentView_Previews: PreviewProvider {
    
    @State static var familyDataPreview = [familyData(personName: "Me", hasAvatar: false, pricePaying: 0, fixedPrice: false)]
    
    static var previews: some View {
        FamilyPaymentView(familyDataArray: $familyDataPreview, subPrice: 10)
    }
}
