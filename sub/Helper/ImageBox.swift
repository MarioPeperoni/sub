//
//  ImageBox.swift
//  sub
//
//  Created by Mateusz on 17/12/2022.
//

import SwiftUI

struct ImageBox: View {
    internal init(iconName: String, size: CGFloat, radius: CGFloat) {
        self.iconName = iconName
        self.size = size
        self.radius = radius
    }
    internal init(iconName: String, size: CGFloat) {
        self.iconName = iconName
        self.size = size
        self.radius = 20
    }
    internal init(iconName: String) {
        self.iconName = iconName
        self.size = 125
        self.radius = 20
    }
    
    @State var iconName: String
    @State var size: CGFloat
    @State var radius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .stroke(style: StrokeStyle(lineWidth: 4, dash: [8, 4]))
            .foregroundColor(.gray)
            .frame(width: size, height: size)
            .overlay {
                Image(iconName + "_Icon")
                    .resizable()
                    .cornerRadius(radius)
                    .frame(width: size + 5, height: size + 5)
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.1)
            }
    }
}

struct ImageBox_Previews: PreviewProvider {
    static var previews: some View {
        ImageBox(iconName: "Spotify")
    }
}
