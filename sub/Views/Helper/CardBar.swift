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
            .frame(height: 160)
            .foregroundColor(Color("BoxColor"))
            .overlay(alignment: .leading) { //Overlay for card image
                chartView()
                    .padding()
                    .offset(y:20)
                    .frame(width: 200)
            }
            .overlay(alignment: .topTrailing) {
                Text("My statistics")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .frame(maxWidth: 170)
            }
            .overlay(alignment: .bottomTrailing) {  //Overlay for plus symbol
                Image(systemName: "arrow.forward.circle.fill")
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
