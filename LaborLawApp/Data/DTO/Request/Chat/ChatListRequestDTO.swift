//
//  ChatListRequestDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import Foundation

struct ChatListRequestDTO: Codable {
    let question: String
    let conversationId: Int?

    enum CodingKeys: String, CodingKey {
        case question
        case conversationId = "conversation_id"
    }
}

extension ChatListRequestDTO {
    init(from domain: ChatAnswer) {
        self.question = domain.text
        self.conversationId = domain.conversationId
    }
}
