//
//  GetAllPostResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

struct GetAllPostResponseDTO: Codable {
    let id: Int
    let title: String
    let category: Int
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case category
        case createdAt = "created_at"
    }
}

extension GetAllPostResponseDTO {
    func toDomain() -> PostList {
        PostList(
            id: self.id,
            title: self.title,
            category: self.category,
            createdAt: self.createdAt
        )
    }
}
