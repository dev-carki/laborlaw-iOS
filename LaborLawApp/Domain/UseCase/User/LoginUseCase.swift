//
//  LoginUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

import Factory

final class LoginUseCase {
    @Injected(\.userDefaultsManager) var userDefaultsManager
    
    let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(_ request: Login) async -> Result<Bool, NetworkError> {
        let loginResult = await self.repository.login(request)
            .mapError({$0.toNetworkError()})

        switch loginResult {
        case .success(let result):
            guard let result = result else { return .failure(NetworkError.NO_DATA) }
            self.userDefaultsManager.accessToken = result.access_token
            
            print("Access Token: ", result.access_token)
            
            return .success(true)
        case .failure(let failure):
            self.userDefaultsManager.accessToken.removeAll()
            
            return .failure(failure)
        }
    }
}
