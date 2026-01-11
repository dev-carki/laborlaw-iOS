//
//  ChatResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

struct ChatResponseDTO: Codable {
    let answer: String
}

extension ChatResponseDTO {
    func toDomain() -> ChatAnswer {
        ChatAnswer(text: answer)
    }
}
