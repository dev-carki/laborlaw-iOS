//
//  CreateReviewRequestDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

struct CreateReviewRequestDTO: Codable {
    let content: String
}

extension CreateReviewRequestDTO {
    init(from domain: PostReviewCreate) {
        self.content = domain.reviewText
    }
}
