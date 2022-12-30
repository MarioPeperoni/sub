//
//  CardCreationScreen.swift
//  sub
//
//  Created by Mateusz on 30/12/2022.
//

import SwiftUI

struct CardCreationScreen: View {
    
    @Binding var subData: subscriptionData
    
    @State var rotate: Int = 0
    
    var body: some View {
        
        let cardNumberString = String(format: "%04d", subData.virtualCardData.cardNo[0]) + " " + String(format: "%04d", subData.virtualCardData.cardNo[1]) + " " + String(format: "%04d", subData.virtualCardData.cardNo[2])    //Nie wiadmo czemu nie moze byc w jednym co nie wiec tam potem sie dodaje reszta
        
            VStack
            {
                visaCard(sizeModifier: 3, imageName: subData.subName)
                    .padding(.top, 50)
                List
                {
                    Section("Your \(subData.subName) card credentials") {
                        HStack
                        {
                            Text("Card Number: ")
                            Text(cardNumberString + " " + String(format: "%04d", subData.virtualCardData.cardNo[3]))
                        }
                        HStack
                        {
                            Text("Card Expiry: " + String(format: "%02d", subData.virtualCardData.cardExp[0]) + "/" + String(format: "%04d", subData.virtualCardData.cardExp[1]))
                                .padding(.trailing)
                            Divider()
                            Text("CVV: " + String(format: "%03d", subData.virtualCardData.cardCVV))
                                .padding(.leading, 15)
                        }
                    }
                }
                .scrollDisabled(true)
                .padding(.top)
                Spacer()
            }
            .task {
                generateNewCard()
            }
    }
    
    func generateNewCard()
    {
        for index in 0..<4
        {
            subData.virtualCardData.cardNo[index] = Int.random(in: 1...9999)
        }
        subData.virtualCardData.cardExp[0] = Int.random(in: 1...12)
        subData.virtualCardData.cardExp[1] = 2027
        subData.virtualCardData.cardCVV = Int.random(in: 1...999)
    }
    
}

struct CardCreationScreen_Previews: PreviewProvider {
    
    @State static var subDataPreview: subscriptionData = subscriptionData(subName: "Netflix", subPirce: 43.00, subEndDate: Date(timeIntervalSince1970: 1672158303), subActive: true, subCategory: "TV", notificationEnabled: false, reminderDelay: 0)
    
    static var previews: some View {
        CardCreationScreen(subData: $subDataPreview)
    }
}
