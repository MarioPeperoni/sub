//
//  FamilyShareButton.swift
//  sub
//
//  Created by Mateusz on 28/12/2022.
//

import SwiftUI

struct BigGradientButton: View {
    
    internal init(gradientColor1: Color, gradientColor2: Color, textShowing: String, imageName: String, stroke: Bool) {
        self.gradientColor1 = gradientColor1
        self.gradientColor2 = gradientColor2
        self.textShowing = textShowing
        self.imageName = imageName
        self.stroke = stroke
    }
    
    internal init() {
        self.gradientColor1 = .orange
        self.gradientColor2 = .accentColor
        self.textShowing = "Big Gradient Button Text!"
        self.imageName = "person.circle.fill"
        self.stroke = false
    }
    
    
    let gradientColor1: Color
    let gradientColor2: Color
    let textShowing: String
    let imageName: String
    let stroke: Bool
    
    var body: some View {
        VStack{
            if (stroke) {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 6)
                    .fill(LinearGradient(gradient: Gradient(colors: [gradientColor1, gradientColor2]), startPoint: .leading, endPoint: .trailing))
                    .frame(height: 50)
                    .overlay
                {
                    HStack{
                        Spacer()
                        Text(textShowing)
                            .foregroundColor(stroke ? .primary : .white)
                            .fontWeight(.bold)
                            .padding(40)
                        Spacer()
                        Image(systemName: imageName)
                            .foregroundColor(stroke ? .primary : .white)
                            .imageScale(.large)
                            .padding(.trailing, 30)
                    }
                }
                .shadow(radius: 2)
            }
            else
            {
                RoundedRectangle(cornerRadius: 50)
                    .fill(LinearGradient(gradient: Gradient(colors: [gradientColor1, gradientColor2]), startPoint: .leading, endPoint: .trailing))
                    .frame(height: 50)
                    .overlay
                {
                    HStack{
                        Spacer()
                        Text(textShowing)
                            .foregroundColor(stroke ? .primary : .white)
                            .fontWeight(.bold)
                            .padding(40)
                        Spacer()
                        Image(systemName: imageName)
                            .foregroundColor(stroke ? .primary : .white)
                            .imageScale(.large)
                            .padding(.trailing, 30)
                    }
                }
                .shadow(radius: 2)
            }
        }
    }
}

struct BigGradientButton_Previews: PreviewProvider {
    static var previews: some View {
        BigGradientButton()
    }
}
