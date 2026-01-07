//
//  SignUpViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var createUser: CreateUser = CreateUser(email: "", password: "", gender: nil, age: nil, salaryRange: nil, industry: nil, employmentType: nil, interestedLaws: [])
}
