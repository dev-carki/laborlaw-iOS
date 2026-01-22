//
//  SignUpViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var createUser: CreateUser = CreateUser(
        email: "",
        password: "",
        nickname: nil,
        gender: nil,
        age: nil,
        salaryRange: nil,
        industry: nil,
        employmentType: nil,
        interestedLaws: []
    )
    
    var normalizedCreateUser: CreateUser {
        var user = createUser

        if let nickname = user.nickname {
            if nickname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                user.nickname = nil
            }
        }

        return user
    }
}
