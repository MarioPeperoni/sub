//
//  subscriptionData.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import Foundation

struct subscriptionData: Identifiable
{
    var id = UUID()
    let subName: String
    let subPirce: Double
    let subEndDate: Date
    let subActive: Bool
    let subDesc: String
    let subCategory: String
}

struct subscriptionList
{
    static let hardCodedDefults = [
        subscriptionData(subName: "Netflix",
                         subPirce: 43.00,
                         subEndDate: Date(timeIntervalSince1970: 1671494400),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "TV"),
        subscriptionData(subName: "Spotify",
                         subPirce: 19.99,
                         subEndDate: Date(timeIntervalSince1970: 1673423454),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Music"),
        subscriptionData(subName: "Discord Nitro",
                         subPirce: 47.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: false,
                         subDesc: "Lorem ipsum",
                         subCategory: "Other"),
        subscriptionData(subName: "Disney+",
                         subPirce: 28.99,
                         subEndDate: Date(timeIntervalSince1970: 1671499990),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "TV"),
        subscriptionData(subName: "HBO MAX",
                         subPirce: 29.99,
                         subEndDate: Date(timeIntervalSince1970: 1673423454),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "TV"),
        subscriptionData(subName: "Amazon Prime",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Other"),
        subscriptionData(subName: "Apple Music",
                         subPirce: 21.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Music"),
        subscriptionData(subName: "Tidal",
                         subPirce: 39.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Music"),
        subscriptionData(subName: "Hulu",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "TV"),
        subscriptionData(subName: "Xbox Game Pass",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Games"),
        subscriptionData(subName: "Allegro Smart",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Other"),
        subscriptionData(subName: "YouTube Premium",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "TV"),
        subscriptionData(subName: "Playstation Plus",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subDesc: "Lorem ipsum",
                         subCategory: "Games"),
    ]
}
