//
//  CreatePostUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

final class CreatePostUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute(_ request: BoardPostCreate) async -> Result<Void, NetworkError> {
        return await self.repository.createPost(request)
            .mapError({$0.toNetworkError()})
    }
}
