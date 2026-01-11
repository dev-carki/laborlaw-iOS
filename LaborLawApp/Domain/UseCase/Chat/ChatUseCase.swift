//
//  ChatUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

final class ChatUseCase {
    let repository: ChatRepository
    
    init(repository: ChatRepository) {
        self.repository = repository
    }
    
    func execute(_ request: String) async -> Result<ChatAnswer, NetworkError> {
        return await self.repository.chat(request)
            .mapError({$0.toNetworkError()})
    }
}
