//
//  localNotificationMenager.swift
//  sub
//
//  Created by Mateusz on 19/12/2022.
//

import Foundation
import NotificationCenter

class localNotificationMenager: ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuth() async throws{
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
    }
    
    func schedule(localNotification: localNotification)
    {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = .default
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: localNotification.dateComponents, repeats: localNotification.repeats)
        
        let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request)
    }

    func removeRequest(withId: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [withId])
    }
}
