//
//  CreateBoardRequestDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

struct CreateBoardRequestDTO: Codable {
    let title: String
    let content: String
    let category_id: Int?
    let hashtags: [String]
}

extension CreateBoardRequestDTO {
    init(from domain: BoardPostCreate) {
        self.title = domain.title
        self.content = domain.content
        self.category_id = domain.categoryId
        self.hashtags = domain.hashtags
    }
}
