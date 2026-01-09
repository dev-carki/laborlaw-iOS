//
//  LoginViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import Foundation

import Factory

final class LoginViewModel: ObservableObject {
    @Injected(\.loginUseCase) var loginUseCase
    @Published var idText: String = ""
    @Published var pwText: String = ""
    
    @Published var loginData: Login = Login(id: "", pw: "")
    
    @Published var isLoginTrying: Bool = false
    @Published var isLoginSuccess: Bool = false
    
    func login() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isLoginTrying = true
        }
        
        let result = await self.loginUseCase.execute(loginData)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.isLoginSuccess = true
                print("요청 성공!: ", response)
            case .failure(let error):
                self.isLoginSuccess = false
                print("요청 실패!: ", error)
            }
            
            self.isLoginTrying = false
        }
    }
}
