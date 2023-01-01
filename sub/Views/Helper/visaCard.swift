//
//  visaCard.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI
import ColorKit

struct visaCard: View {
    
    internal init(sizeModifier: CGFloat, imageName: String) {
        self.sizeModifier = sizeModifier
        self.colorFromImage = true
        self.imageName = imageName
    }
    
    internal init(sizeModifier: CGFloat) {
        self.sizeModifier = sizeModifier
        self.colorFromImage = false
        self.imageName = "Spotify"
    }
    
    var sizeModifier: CGFloat
    
    let colorFromImage: Bool
    let imageName: String
    
    @State var rotate: Int = 0  //Rotate degrees for animation
    
    var body: some View {
        
        let image = UIImage(named: imageName + "_Icon")
        let averageColor = try? image?.dominantColors()
        let colorColor1 = Color(averageColor?[1] ?? .purple)
        let colorColor2 = Color(averageColor?[2] ?? .systemPink)
        
        Button {
            withAnimation(.spring(response: 1.25, dampingFraction: 0.7)) {
                rotate -= 360
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [colorFromImage ? colorColor1 : .purple, colorFromImage ? colorColor2 : .pink]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
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
                .rotation3DEffect(Angle(degrees: Double(rotate)), axis: (x: 0, y: 1, z: 0)) //Flip animation
        }
    }
}

struct visaCard_Previews: PreviewProvider {
    static var previews: some View {
        visaCard(sizeModifier: 3, imageName: "Playstation Plus")
    }
}
