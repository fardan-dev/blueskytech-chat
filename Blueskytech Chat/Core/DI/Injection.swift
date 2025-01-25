//
//  Injection.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    private func provideRepository() -> ChatRepositoryProtocol {
        let realm = try? Realm()
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        return ChatRepository(locale: locale)
    }
    
    func provideChats() -> ChatUseCase {
        let repository = provideRepository()
        return ChatsInteractor(repository: repository)
    }
}
