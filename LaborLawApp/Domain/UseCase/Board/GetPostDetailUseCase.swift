//
//  GetPostDetailUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

final class GetPostDetailUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute(postId: Int) async -> Result<PostDetail, NetworkError> {
        return await self.repository.getPostDetail(postId: postId)
            .mapError({$0.toNetworkError()})
    }
}
