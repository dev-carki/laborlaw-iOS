//
//  CreateBoardResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

struct CreateBoardResponseDTO: Codable {
    let id: Int
    let title: String
    let content: String
    let category: String
    let hashtags: [String]
    let authorNickname: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case category
        case hashtags
        case authorNickname = "author_nickname"
        case createdAt = "created_at"
    }
}
