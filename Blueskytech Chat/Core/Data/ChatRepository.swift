//
//  ChatRepository.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation
import Combine

protocol ChatRepositoryProtocol {
    func getChats(userSender: String) -> AnyPublisher<[ChatModel], Error>
    func addChat(user: String, message: String) -> AnyPublisher<Bool, Error>
}

class ChatRepository: NSObject {
    typealias ChatInstance = (LocaleDataSource) -> ChatRepository
    fileprivate let locale: LocaleDataSource
    
    static var sharedInstance: ChatInstance = { localeRepo in
        return ChatRepository(locale: localeRepo)
    }
    
    init(locale: LocaleDataSource) {
        self.locale = locale
    }
}

extension ChatRepository: ChatRepositoryProtocol {
    func getChats(userSender: String) -> AnyPublisher<[ChatModel], Error> {
        return self.locale.getChats(userSender: userSender)
            .map{ ChatMapper.mapChatEntitiesToDomains(input: $0, userSender: userSender) }
            .eraseToAnyPublisher()
    }
    
    func addChat(user: String, message: String) -> AnyPublisher<Bool, Error> {
        return locale
            .addChat(user: user, message: message)
            .eraseToAnyPublisher()
    }
}
