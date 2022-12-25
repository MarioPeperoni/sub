//
//  StatElement.swift
//  sub
//
//  Created by Mateusz on 23/12/2022.
//

import SwiftUI

struct StatElement: View {
    
    internal init(statTypeID: Int, value: Double, big: Bool)
    {
        switch statTypeID
        {
        case 1: //Total spend
            self.imageColor = .accentColor
            self.imageName = "creditcard.fill"
            self.value = value
            self.text = "Total spent"
            break
        default:    //Default
            self.imageColor = .accentColor
            self.imageName = "calendar"
            self.value = 130.49
            self.text = "Stat description"
            break
        }
        self.imageBGSize = big ? 130 : 80
        self.fontSize = big ? 50 : 30
        self.imageOpacity = 0.4
    }
    
    internal init()
    {
        self.imageBGSize = 80
        self.fontSize = 30
        self.imageColor = .accentColor
        self.imageOpacity = 0.4
        self.imageName = "calendar"
        self.value = 130.49
        self.text = "Stat description"
    }
    
    let imageBGSize: CGFloat
    let fontSize: CGFloat
    let imageColor: Color
    let imageOpacity: CGFloat
    let imageName: String
    let value: Double
    let text: String
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", value) + "zł")
                .font(.system(size: fontSize, design: .rounded))
                .fontWeight(.bold)
                .background()
            {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(imageOpacity)
                    .foregroundColor(imageColor)
                    .frame(width: imageBGSize)
            }
            Text(text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 1.0)
        }
    }
}

struct StatElement_Previews: PreviewProvider {
    static var previews: some View {
        StatElement(statTypeID: 1, value: 30.0, big: true)
    }
}
