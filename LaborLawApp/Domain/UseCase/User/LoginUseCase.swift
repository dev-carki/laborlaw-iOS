//
//  LoginUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

final class LoginUseCase {
    let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(_ request: Login) async -> Result<LoginResult, NetworkError> {
        return await self.repository.login(request)
            .mapError({$0.toNetworkError()})
    }
}
