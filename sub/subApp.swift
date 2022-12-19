//
//  subApp.swift
//  sub
//
//  Created by Mateusz on 15/12/2022.
//

import SwiftUI

@main
struct subApp: App {
    @StateObject var lnMenager = localNotificationMenager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(lnMenager)
        }
    }
}
