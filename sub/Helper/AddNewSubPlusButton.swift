//
//  AddNewSubPlusButton.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct AddNewSubPlusButton: View {
    var body: some View {
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
}

struct AddNewSubPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSubPlusButton()
    }
}
