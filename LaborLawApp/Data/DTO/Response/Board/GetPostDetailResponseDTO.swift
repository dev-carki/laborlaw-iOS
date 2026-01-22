//
//  GetPostDetailResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

struct GetPostDetailResponseDTO: Codable {
    let id: Int
    let title: String
    let content: String
    let category: Int
    let authorNickname: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case category
        case authorNickname = "author_nickname"
        case createdAt = "created_at"
    }
}

extension GetPostDetailResponseDTO {
    func toDomain() -> PostDetail {
        PostDetail(
            serverId: self.id,
            titleText: self.title,
            contentText: self.content,
            category: self.category,
            nickName: self.authorNickname,
            createdAt: self.createdAt
        )
    }
}
