//
//  FamilyRow.swift
//  sub
//
//  Created by Mateusz on 25/12/2022.
//

import SwiftUI

struct FamilyRow: View {
    
    @State var familyData: familyData
    
    var body: some View {
        HStack
        {
            Circle()
                .frame(width: 40)
                .foregroundColor(Color("SelectionColor"))
                .overlay()
            {
                Image(systemName: "person.fill")
                    .foregroundColor(.accentColor)
                    .imageScale(.large)
            }
            Text(familyData.personName)
                .padding(10)
            Spacer()
            Text(String(format: "%.2f", familyData.pricePaying) + "zł")
        }
    }
}

struct FamilyRow_Previews: PreviewProvider {
    static var previews: some View {
        FamilyRow(familyData: familyData(personName: "Me", hasAvatar: false, pricePaying: 20.0, fixedPrice: false))
    }
}
