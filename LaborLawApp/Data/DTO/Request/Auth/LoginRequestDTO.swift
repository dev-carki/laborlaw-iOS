//
//  LoginRequestDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

struct LoginRequestDTO: Codable {
    let email: String
    let password: String
}

extension LoginRequestDTO {
    init(from domain: Login) {
        self.email = domain.id
        self.password = domain.pw
    }
}
