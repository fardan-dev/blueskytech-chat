//
//  ChatPresenter.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Combine
import UserNotifications

class ChatPresenter: ObservableObject {
    func scheduleLocalNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        // Tetapkan waktu pemicu (contoh: 5 detik dari sekarang)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // Buat request dengan identifier unik
        let request = UNNotificationRequest(identifier: "chat_notification", content: content, trigger: trigger)
        
        // Tambahkan notifikasi ke pusat notifikasi
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled!")
            }
        }
    }
}
