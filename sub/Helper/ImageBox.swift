//
//  ImageBox.swift
//  sub
//
//  Created by Mateusz on 17/12/2022.
//

import SwiftUI

struct ImageBox: View {
    
    @State var iconName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(style: StrokeStyle(lineWidth: 4, dash: [8, 4]))
            .foregroundColor(.gray)
            .frame(width: 125, height: 125)
            .overlay {
                Image(iconName + "_Icon")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 130, height: 130)
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.1)
            }
    }
}

struct ImageBox_Previews: PreviewProvider {
    static var previews: some View {
        ImageBox(iconName: "Netflix")
    }
}
