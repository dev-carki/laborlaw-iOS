//
//  CreateUserResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

struct CreateUserResponseDTO: Codable {
    let id: Int
    let email: String
}

extension CreateUserResponseDTO {
    func toDomain() -> SignUpResult {
        SignUpResult(
            userId: self.id,
            email: self.email
        )
    }
}
