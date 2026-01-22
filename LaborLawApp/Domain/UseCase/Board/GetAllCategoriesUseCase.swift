//
//  GetAllCategoriesUseCase.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

final class GetAllCategoriesUseCase {
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[PostCategory], NetworkError> {
        return await self.repository.getAllCategories()
            .mapError({$0.toNetworkError()})
    }
}
