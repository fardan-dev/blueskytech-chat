//
//  ChatEntity.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation
import RealmSwift

class ChatEntity: Object {
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var user: String = ""
    @objc dynamic var message: String = ""
    @objc dynamic var createdAt: Date = Date()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
