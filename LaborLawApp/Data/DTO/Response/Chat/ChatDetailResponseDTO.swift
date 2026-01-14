//
//  ChatDetailResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/15/26.
//

import Foundation

struct ConversationDetailResponseDTO: Codable {
    let id: Int
    let title: String?
    let messages: [ChatDetailResponseDTO]
}

struct ChatDetailResponseDTO: Codable {
    let id: Int
    let role: String
    let content: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case role
        case content
        case createdAt = "created_at"
    }
}

extension ChatDetailResponseDTO {
    func toDomain() -> ChatMessage {
        ChatMessage(
            serverId: self.id,
            role: ChatRole(from: self.role),
            text: self.content,
            createdAt: self.createdAt.toKoreanDateString()
        )
    }
}
