//
//  AuthRepositoryIMPL.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

class AuthRepositoryIMPL: AuthRepository {
    let api: LaborLawAPI
    
    init(api: LaborLawAPI) {
        self.api = api
    }
    
    func login(_ request: Login) async -> Result<LoginResult?, LaborLawNetworkError> {
        let dto = LoginRequestDTO(from: request)
        
        let result = await api.login(dto)
        
        return result.map { wrapper in
            wrapper.data.toDomain()
        }
    }
}
