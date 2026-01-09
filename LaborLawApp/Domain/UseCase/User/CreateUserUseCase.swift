//
//  CreateUserUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

final class CreateUserUseCase {
    let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(_ request: CreateUser) async -> Result<SignUpResult, NetworkError> {
        return await self.repository.createUser(request)
            .mapError({$0.toNetworkError()})
    }
}
