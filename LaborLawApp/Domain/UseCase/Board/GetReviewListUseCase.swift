//
//  GetReviewListUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

final class GetReviewListUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute(postId: Int) async -> Result<[PostReviewList], NetworkError> {
        return await self.repository.getReviewList(postId: postId)
            .mapError({$0.toNetworkError()})
    }
}
