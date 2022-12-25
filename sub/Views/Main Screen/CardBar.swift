//
//  cardBar.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

struct CardBar: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: .infinity, height: 160)
            .foregroundColor(Color("BoxColor"))
            .overlay(alignment: .leading) { //Overlay for card image
                visaCard(sizeModifier: 2.5)
                    .offset(x: -50)
                    .grayscale(0.0)
            }
            .overlay(alignment: .topTrailing) {
                Text("Create new card")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .frame(maxWidth: 170)
            }
            .overlay(alignment: .bottomTrailing) {  //Overlay for plus symbol
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .offset()
                    .padding()
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20))
            }
            .clipped()
            .padding()
            .shadow(radius: 2)
    }
}

struct CardBar_Previews: PreviewProvider {
    static var previews: some View {
        CardBar()
    }
}
