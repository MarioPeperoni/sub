//
//  UserIcon.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct UserIcon: View {
    var body: some View {
        Circle()
            .frame(width: 50)
            .foregroundColor(.accentColor)
            .overlay {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(Color("BoxColor"))
                    .overlay
                {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
            }
    }
}

struct UserIcon_Previews: PreviewProvider {
    static var previews: some View {
        UserIcon()
    }
}
