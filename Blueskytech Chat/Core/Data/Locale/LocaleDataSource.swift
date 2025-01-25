//
//  LocaleDataSource.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol {
    func getChats() -> AnyPublisher<[ChatEntity], Error>
    func addChat(chat: ChatEntity) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    func getChats() -> AnyPublisher<[ChatEntity], any Error> {
        return Future<[ChatEntity], Error> { completion in
            if let realm = self.realm {
                let chats: Results<ChatEntity> = {
                    realm.objects(ChatEntity.self).sorted(byKeyPath: "createdAt", ascending: true)
                }()
                completion(.success(chats.toArray(ofType: ChatEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addChat(chat: ChatEntity) -> AnyPublisher<Bool, any Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write ({
                        realm.add(chat, update: .all)
                        completion(.success(true))
                    })
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
