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
            .foregroundColor(Color("AppColor"))
            .overlay {
                Image(systemName: "plus")
                    .foregroundColor(.accentColor)
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
