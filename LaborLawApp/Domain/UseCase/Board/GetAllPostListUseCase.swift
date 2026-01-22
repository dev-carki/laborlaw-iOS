//
//  GetAllPostListUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

final class GetAllPostListUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[PostList], NetworkError> {
        return await self.repository.getAllPostList()
            .mapError({$0.toNetworkError()})
    }
}
