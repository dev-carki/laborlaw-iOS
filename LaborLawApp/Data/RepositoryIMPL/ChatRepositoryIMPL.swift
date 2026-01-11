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
    
    func chat(_ request: String) async -> Result<ChatAnswer, LaborLawNetworkError> {
        let dto = ChatRequestDTO(question: request)
        
        let result = await api.chat(dto)
        
        return result.map { wrapper in
            wrapper.data.toDomain()
        }
    }
}
