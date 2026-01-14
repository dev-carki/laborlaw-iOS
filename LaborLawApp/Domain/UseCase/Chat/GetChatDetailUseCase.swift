//
//  GetChatDetailUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/15/26.
//

import Foundation

final class GetChatDetailUseCase {
    let repository: ChatRepository
    
    init(repository: ChatRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) async -> Result<[ChatMessage], NetworkError> {
        return await self.repository.getChatDetail(id: id)
            .mapError({$0.toNetworkError()})
    }
}
