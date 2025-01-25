//
//  ChatPresenter.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Combine
import UserNotifications

class ChatPresenter: ObservableObject {
    private var cancellable: Set<AnyCancellable> = []
    private var chatUseCase: ChatUseCase
    
    @Published var chatsModel: [ChatModel] = []
    @Published var alertMessage = ""
    @Published var showAlert = false
    
    init(chatUseCase: ChatUseCase) {
        self.chatUseCase = chatUseCase
    }
}

extension ChatPresenter {
    func getChats(user: String) {
        chatUseCase
            .getChats(userSender: user)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.alertMessage = error.localizedDescription
                    self.showAlert.toggle()
                default:
                    break
                }
            } receiveValue: { chats in
                self.chatsModel = chats
            }
            .store(in: &cancellable)

    }
    
    func addChat(user: String, message: String) {
        chatUseCase
            .addChat(name: user, message: message)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.alertMessage = error.localizedDescription
                    self.showAlert.toggle()
                default:
                    break
                }
            } receiveValue: { isSuccess in
                let chatModel = ChatModel(id: "" ,user: "User \(user.capitalized)", message: message, isUserSender: true)
                self.chatsModel.append(chatModel)
                self.scheduleLocalNotification(title: "User \(user.capitalized)", body: message)
            }
            .store(in: &cancellable)

    }
    
    func scheduleLocalNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "chat_notification", content: content, trigger: trigger)
        
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
