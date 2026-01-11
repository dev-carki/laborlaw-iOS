//
//  LaborLawAPI.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

class LaborLawAPI {
    var host: String
    let networkService: LaborLawNetworkService
    
    init(networkService: LaborLawNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}

// MARK: Chat
extension LaborLawAPI {
    func chat(_ request: ChatRequestDTO) async -> Result<LaborLawResponseWrapper<ChatResponseDTO>, LaborLawNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: LaborLawEndpoints.RAG.chat.url, auth: true, httpBody: body)
    }
}

// MARK: User
extension LaborLawAPI {
    func createUser(_ request: CreateUserRequestDTO) async -> Result<LaborLawResponseWrapper<CreateUserResponseDTO>, LaborLawNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: LaborLawEndpoints.User.CreateUser.url, httpBody: body)
    }
}

// MARK: Auth
extension LaborLawAPI {
    func login(_ request: LoginRequestDTO) async -> Result<LaborLawResponseWrapper<LoginResponseDTO>, LaborLawNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: LaborLawEndpoints.Auth.login.url, httpBody: body)
    }
}
