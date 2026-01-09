//
//  LoginResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

struct LoginResponseDTO: Codable {
    let access_token: String
    let token_type: String
}

extension LoginResponseDTO {
    func toDomain() -> LoginResult {
        LoginResult(
            access_token: self.access_token,
            token_type: self.token_type
        )
    }
}
