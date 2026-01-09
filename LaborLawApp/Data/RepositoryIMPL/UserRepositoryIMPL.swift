//
//  UserRepositoryIMPL.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

class UserRepositoryIMPL: UserRepository {
    let api: LaborLawAPI
    
    init(api: LaborLawAPI) {
        self.api = api
    }
    
    func createUser(_ request: CreateUser) async -> Result<SignUpResult, LaborLawNetworkError> {
        let dto = CreateUserRequestDTO(from: request)
        
        let result = await api.createUser(dto)
        
        return result.map { wrapper in
            wrapper.data.toDomain()
        }
    }
}
