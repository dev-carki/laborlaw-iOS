//
//  ChatRepositoryIMPL.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

class ChatRepositoryIMPL: ChatRepository {
    let api: LaborLawAPI
    
    init(api: LaborLawAPI) {
        self.api = api
    }
    
    func chat(_ request: ChatAnswer) async -> Result<ChatAnswer, LaborLawNetworkError> {
        let dto = ChatRequestDTO(from: request)
        
        let result = await api.chat(dto)
        
        return result.map { wrapper in
            wrapper.data.toDomain()
        }
    }
    
    func getChatList() async -> Result<[ChatList], LaborLawNetworkError> {
        let result = await api.getChatList()
        
        return result.map { wrapper in
            wrapper.data.map{ $0.toDomain() }
        }
    }
    
    func getChatDetail(id: Int) async -> Result<[ChatMessage], LaborLawNetworkError> {
        let result = await api.getChatDetail(id: id)
        
        return result.map { wrapper in
            wrapper.data.messages.map { $0.toDomain() }
        }
    }
}
