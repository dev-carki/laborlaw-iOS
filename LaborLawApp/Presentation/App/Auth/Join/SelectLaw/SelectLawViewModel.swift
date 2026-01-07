//
//  SelectLawViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class SelectLawViewModel: ObservableObject {
    @Published var signUpViewModel: SignUpViewModel
    
    @Published var selectedLawCodes: [LawCode] = []
    
    init(signUpViewModel: SignUpViewModel) {
        self.signUpViewModel = signUpViewModel
    }
    
    func toggleLawCode(_ code: LawCode) {
        if selectedLawCodes.contains(code) {
            selectedLawCodes.removeAll { $0 == code }
        } else {
            selectedLawCodes.append(code)
        }

        signUpViewModel.createUser.interestedLaws = selectedLawCodes
    }

}
