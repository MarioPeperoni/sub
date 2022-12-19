//
//  subscriptionData.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import Foundation

struct subscriptionData: Identifiable
{
    internal init(id: UUID = UUID(), subName: String, subPirce: Double, subEndDate: Date, subActive: Bool, subCategory: String, notificationEnabled: Bool, reminderDelay: Int) {
        self.id = id
        self.subName = subName
        self.subPirce = subPirce
        self.subEndDate = subEndDate
        self.subActive = subActive
        self.subCategory = subCategory
        self.notificationEnabled = notificationEnabled
        self.reminderDelay = reminderDelay
        self.monthly = true
        self.flagedToDelete = false
    }
    
    var id = UUID()
    var subName: String
    var subPirce: Double
    var subEndDate: Date
    var subActive: Bool
    var subCategory: String
    var notificationEnabled: Bool
    var reminderDelay: Int
    var monthly: Bool
    var flagedToDelete: Bool
}

struct subscriptionList
{
    static var hardCodedDefults = [
        subscriptionData(subName: "Netflix",
                         subPirce: 43.00,
                         subEndDate: Date(timeIntervalSince1970: 1671494400),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Spotify",
                         subPirce: 19.99,
                         subEndDate: Date(timeIntervalSince1970: 1673423454),
                         subActive: true,
                         subCategory: "Music",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Discord Nitro",
                         subPirce: 47.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: false,
                         subCategory: "Other",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Disney+",
                         subPirce: 28.99,
                         subEndDate: Date(timeIntervalSince1970: 1671499990),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "HBO MAX",
                         subPirce: 29.99,
                         subEndDate: Date(timeIntervalSince1970: 1673423454),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Amazon Prime",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Other",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Apple Music",
                         subPirce: 21.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Music",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Tidal",
                         subPirce: 39.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Music",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Hulu",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Xbox Game Pass",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Games",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Allegro Smart",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Other",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "YouTube Premium",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "TV",
                         notificationEnabled: false,
                         reminderDelay: 0),
        subscriptionData(subName: "Playstation Plus",
                         subPirce: 10.99,
                         subEndDate: Date(timeIntervalSince1970: 1671423774),
                         subActive: true,
                         subCategory: "Games",
                         notificationEnabled: false,
                         reminderDelay: 0)
    ]
}
