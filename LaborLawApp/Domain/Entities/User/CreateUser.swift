//
//  CreateUser.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

struct CreateUser {
    var email: String
    var password: String

    var gender: Gender?
    var age: String?
    var salaryRange: SalaryRange?
    var industry: String?
    var employmentType: EmploymentType?
    var interestedLaws: [LawCode]

    init(
        email: String,
        password: String,
        gender: Gender?,
        age: String?,
        salaryRange: SalaryRange?,
        industry: String?,
        employmentType: EmploymentType?,
        interestedLaws: [LawCode]
    ) {
        self.email = email
        self.password = password
        self.gender = gender
        self.age = age
        self.salaryRange = salaryRange
        self.industry = industry
        self.employmentType = employmentType
        self.interestedLaws = interestedLaws
    }
}
