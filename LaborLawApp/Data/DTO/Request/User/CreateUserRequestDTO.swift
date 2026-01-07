//
//  CreateUserRequestDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

struct CreateUserRequestDTO: Codable {
    let email: String
    let password: String
    let gender: String?
    let age: Int?
    let salary_range: String?
    let industry: String?
    let employment_type: String?
    let interested_laws: [String]
}

extension CreateUserRequestDTO {
    init(from domain: CreateUser) {
        self.email = domain.email
        self.password = domain.password
        self.gender = domain.gender?.rawValue
        self.age = domain.age.flatMap { Int($0) }
        self.salary_range = domain.salaryRange?.rawValue
        self.industry = domain.industry
        self.employment_type = domain.employmentType?.rawValue
        self.interested_laws = domain.interestedLaws.map { $0.rawValue }
    }
}
