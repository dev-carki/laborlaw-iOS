//
//  InputIDPWViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class InputIDPWViewModel: ObservableObject {
    let regexHelper: RegexHelper = RegexHelper()
    
    @Published var signUpViewModel = SignUpViewModel()
    
    @Published var inputEmailText: String = ""
    @Published var isInputEmailTextError: Bool = false
    
    @Published var inputPWText: String = ""
    
    @Published var inputConfirmPWText: String = ""
    @Published var isInputConfirmPWTextError: Bool = false
    
    @Published var isButtonDisable: Bool = true
    
    func nextButtonClicked() {
        self.signUpViewModel.createUser.email = inputEmailText
        self.signUpViewModel.createUser.password = inputConfirmPWText
    }
    
    func dismiss() {
        self.signUpViewModel.createUser.email = ""
        self.signUpViewModel.createUser.password = ""
    }
}
