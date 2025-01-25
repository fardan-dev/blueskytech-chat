//
//  ChatModel.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import Foundation

struct ChatModel: Equatable, Identifiable {
    var id: String
    var user: String
    var message: String
    var isUserSender: Bool
}
