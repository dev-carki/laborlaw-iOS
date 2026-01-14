//
//  ChatResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

struct ChatResponseDTO: Codable {
    let answer: String
    let conversationId: Int?

    enum CodingKeys: String, CodingKey {
        case answer
        case conversationId = "conversation_id"
    }
}

extension ChatResponseDTO {
    func toDomain() -> ChatAnswer {
        ChatAnswer(
            text: self.answer,
            conversationId: self.conversationId
        )
    }
}
