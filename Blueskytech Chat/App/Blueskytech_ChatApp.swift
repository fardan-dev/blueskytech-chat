//
//  Blueskytech_ChatApp.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import SwiftUI
import UserNotifications

@main
struct Blueskytech_ChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var chatPresenter = ChatPresenter(chatUseCase: Injection().provideChats())
    
    var body: some Scene {
        WindowGroup {
            ChatView(presenter: chatPresenter)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        requestNotificationPermission()
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
            if granted {
                print("Permission granted")
            } else {
                print("Permission denied")
            }
        }
    }
}
