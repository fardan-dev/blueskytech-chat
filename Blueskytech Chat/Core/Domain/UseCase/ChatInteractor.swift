//
//  ChatInteractor.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation
import Combine

protocol ChatUseCase {
    func getChats() -> AnyPublisher<[ChatModel], Error>
    func addChat(name: String, message: String) -> AnyPublisher<Bool, Error>
}

class ChatsInteractor: ChatUseCase {
    let repository: ChatRepositoryProtocol
    
    required init(repository: ChatRepositoryProtocol) {
        self.repository = repository
    }
    
    func getChats() -> AnyPublisher<[ChatModel], Error> {
        return repository
            .getChats()
            .eraseToAnyPublisher()
    }
    
    func addChat(name: String, message: String) -> AnyPublisher<Bool, Error> {
        return repository
            .addChat(user: name, message: message)
            .eraseToAnyPublisher()
    }
}
