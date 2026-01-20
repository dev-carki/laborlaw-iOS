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
    
    func getChatList() async -> Result<LaborLawResponseWrapper<[ChatListResponseDTO]>, LaborLawNetworkError> {
        
        return await self.networkService.get(self.host, url: LaborLawEndpoints.RAG.chatList.url, auth: true)
    }
    
    func getChatDetail(id: Int) async -> Result<LaborLawResponseWrapper<ConversationDetailResponseDTO>, LaborLawNetworkError> {
        
        return await self.networkService.get(self.host, url: LaborLawEndpoints.RAG.chatDetail(id: id).url, auth: true)
    }
}

// MARK: Board
extension LaborLawAPI {
    func createPost(_ request: CreateBoardRequestDTO) async -> Result<LaborLawResponseWrapper<LaborLawEmptyResponse>, LaborLawNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: LaborLawEndpoints.Board.createPost.url, auth: true, httpBody: body)
    }
    
    func getAllCategories() async -> Result<LaborLawResponseWrapper<[GetAllCategoriesResponseDTO]>, LaborLawNetworkError> {
        
        return await self.networkService.get(self.host, url: LaborLawEndpoints.Board.getAllCategories.url)
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
