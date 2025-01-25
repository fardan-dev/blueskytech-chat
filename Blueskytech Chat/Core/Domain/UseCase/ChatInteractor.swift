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
}
