//
//  ChatMapper.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation

final class ChatMapper {
    static func mapChatEntitiesToDomains(input chatEntities: [ChatEntity]) -> [ChatModel] {
        return chatEntities.map { result in
            return ChatModel(
                id: "\(result._id)",
                user: result.user,
                message: result.message
            )
        }
    }
}
