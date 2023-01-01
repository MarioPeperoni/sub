//
//  RechargingMethodOption.swift
//  sub
//
//  Created by Mateusz on 01/01/2023.
//

import SwiftUI

struct RechargingMethodOption: View {
    
    let textShown: String
    @State var showCheckmark: Bool
    let optionIcon: String
    
    var body: some View {
        HStack
        {
            Image(systemName: optionIcon)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(textShown)
                .foregroundColor(.primary)
            Spacer()
            if (showCheckmark) {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .foregroundColor(.green)
            }
        }
    }
}

struct RechargingMethodOption_Previews: PreviewProvider {
    static var previews: some View {
        RechargingMethodOption(textShown: "Text", showCheckmark: true, optionIcon: "creditcard.and.123")
    }
}
