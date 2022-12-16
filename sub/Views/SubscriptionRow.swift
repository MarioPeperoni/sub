//
//  SubscriptionRow.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI


struct SubscriptionRow: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        return formatter
    }()
    
    let subName: String
    let subPrice: Double
    let subEndDate: Date
    let subActive: Bool
    
    var body: some View {
        
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: .infinity, height: 100)
                .foregroundColor(.accentColor)
                .overlay(alignment: .topLeading) {
                    HStack
                    {
                        Image("\(subName)_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                            .grayscale(subActive ? 0.0 : 1.0)
                            .padding()
                        Text(subName)
                            .font(.title2)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .padding()
                            .foregroundColor(.primary)
                    }
                    .offset(y: -7)
                }
                .overlay() {
                    VStack{
                        Divider()
                            .offset(y: 7)
                    }
                }
                .overlay(alignment: .bottomLeading) {
                    if(subActive)
                    {
                        Text("Next payment: \(dateFormatter.string(from: subEndDate))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    else
                    {
                        Text("End of subscription: \(dateFormatter.string(from: subEndDate))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    Spacer()
                }
                .overlay(alignment: .bottomTrailing) {
                    if(subActive)
                    {
                        Text(String(format: "%.f", subPrice) + " zł")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                    }
                    else
                    {
                        Text(String(format: "%.f", subPrice) + " zł")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                            .strikethrough()
                    }
                }
                .shadow(radius: 2)
                .padding()
        }
    }
}

struct SubscriptionRow_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionRow(subName: "Netflix", subPrice: 43.00, subEndDate: Date(timeIntervalSince1970: 1671494400), subActive: true)
    }
}
