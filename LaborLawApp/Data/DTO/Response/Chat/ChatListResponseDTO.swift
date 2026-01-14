//
//  ChatListResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import Foundation

struct ChatListResponseDTO: Codable {
    let id: Int
    let title: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt = "created_at"
    }
}

extension ChatListResponseDTO {
    func toDomain() -> ChatList {
        ChatList(
            id: self.id,
            title: self.title,
            createdAt: self.createdAt.toKoreanDateString()
        )
    }
}
