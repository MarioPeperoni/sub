//
//  FamilyPaymentView.swift
//  sub
//
//  Created by Mateusz on 25/12/2022.
//

import SwiftUI

struct FamilyPaymentView: View {
    var body: some View {
        NavigationView {
            List
            {
                FamilyRow(familyData: familyData(personName: "Me", hasAvatar: false, pricePaying: 10.0))
                FamilyRow(familyData: familyData(personName: "Mariusz Pudzianowski", hasAvatar: false, pricePaying: 20.0))
                FamilyRow(familyData: familyData(personName: "Robert Kubica", hasAvatar: false, pricePaying: 20.0))
                FamilyRow(familyData: familyData(personName: "Adi", hasAvatar: false, pricePaying: 20.0))
            }
            .offset(y:-30)
            .toolbar()
            {
                ToolbarItem
                {
                    Button {
                        print("Add new człowiek")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle(Text("Family Share"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FamilyPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyPaymentView()
    }
}
