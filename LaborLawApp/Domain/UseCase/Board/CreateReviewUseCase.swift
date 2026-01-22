//
//  CreateReviewUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

final class CreateReviewUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute(postId: Int, request: PostReviewCreate) async -> Result<Void, NetworkError> {
        return await self.repository.createReview(postId: postId, request: request)
            .mapError({$0.toNetworkError()})
    }
}
