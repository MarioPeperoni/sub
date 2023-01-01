//
//  UserIcon.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct UserIcon: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet = true
        } label: {
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
        .sheet(isPresented: $showSheet) {
            Text("Settings")
        }
    }
}

struct UserIcon_Previews: PreviewProvider {
    static var previews: some View {
        UserIcon()
    }
}
