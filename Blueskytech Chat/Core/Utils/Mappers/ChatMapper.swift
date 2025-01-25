//
//  ChatMapper.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation

final class ChatMapper {
    static func mapChatEntitiesToDomains(input chatEntities: [ChatEntity], userSender: String) -> [ChatModel] {
        return chatEntities.map { result in
            return ChatModel(
                id: "\(result.id)",
                user: result.user == "left" ? "User Left" : "User Right",
                message: result.message,
                isUserSender: result.user == userSender ? true : false
            )
        }
    }
}
