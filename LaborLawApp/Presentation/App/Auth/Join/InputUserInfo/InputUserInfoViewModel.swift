//
//  InputUserInfoViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class InputUserInfoViewModel: ObservableObject {
    @Published var signUpViewModel: SignUpViewModel
    
    @Published var nicknameText: String = ""
    @Published var gender: Gender?
    
    @Published var ageText: String = ""
    let ageTextMaxLength: Int = 2
    
    @Published var salary: SalaryRange?
    
    @Published var industryText: String = ""
    
    @Published var employment: EmploymentType?
    
    init(signUpViewModel: SignUpViewModel) {
        self.signUpViewModel = signUpViewModel
    }
    
    func updateAgeText(_ newValue: String) {
        if newValue.count <= 2 {
            self.ageText = newValue
        } else {
            self.ageText = String(newValue.prefix(ageTextMaxLength))
        }
    }
    
    func dismiss() {
        signUpViewModel.createUser.nickname = nil
        signUpViewModel.createUser.gender = nil
        signUpViewModel.createUser.age = nil
        signUpViewModel.createUser.salaryRange = nil
        signUpViewModel.createUser.industry = nil
        signUpViewModel.createUser.employmentType = nil
    }
}
