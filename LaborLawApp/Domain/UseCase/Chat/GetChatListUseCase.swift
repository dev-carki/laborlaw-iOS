//
//  GetChatListUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import Foundation

final class GetChatListUseCase {
    let repository: ChatRepository
    
    init(repository: ChatRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[ChatList], NetworkError> {
        return await self.repository.getChatList()
            .mapError({$0.toNetworkError()})
    }
}

