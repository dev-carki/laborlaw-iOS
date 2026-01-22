//
//  GetReviewListResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

struct GetReviewListResponseDTO: Codable {
    let id: Int
    let content: String
    let nickName: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case content
        case nickName = "nickname"
        case createdAt = "created_at"
    }
}

extension GetReviewListResponseDTO {
    func toDomain() -> PostReviewList {
        PostReviewList(
            serverId: self.id,
            contentText: self.content,
            nickName: self.nickName,
            createdAt: self.createdAt
        )
    }
}
