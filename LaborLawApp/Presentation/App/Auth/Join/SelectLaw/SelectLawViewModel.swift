//
//  SelectLawViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

import Factory

final class SelectLawViewModel: ObservableObject {
    @Injected(\.createUserUseCase) var createUserUseCase
    
    @Published var signUpViewModel: SignUpViewModel
    
    @Published var selectedLawCodes: [LawCode] = []
    
    @Published var isUserCreating: Bool = false
    @Published var isUserCreatingSuccess: Bool = false
    
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

    func createUser() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isUserCreating = true
        }
        
        let result = await self.createUserUseCase.execute(signUpViewModel.createUser)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.isUserCreatingSuccess = true
                print("요청 성공!: ", response)
            case .failure(let error):
                self.isUserCreatingSuccess = false
                print("요청 실패!: ", error)
            }
            
            self.isUserCreating = false
        }
    }
}
