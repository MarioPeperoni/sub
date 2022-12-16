//
//  visaCard.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI


struct visaCard: View {
    
    var sizeModifier: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing))
        
            .frame(width: 85.60 * sizeModifier, height: 53.98 * sizeModifier)
        
            .overlay(alignment: .bottomTrailing) {
                Image("Visa_Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22 * sizeModifier)
                    .foregroundColor(.white)
                    .blendMode(.normal)
                    .offset(x: -15, y: -15)
            }
    }
}

struct visaCard_Previews: PreviewProvider {
    static var previews: some View {
        visaCard(sizeModifier: 3)
    }
}
