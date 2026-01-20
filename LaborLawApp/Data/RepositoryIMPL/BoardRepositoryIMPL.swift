//
//  BoardRepositoryIMPL.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

class BoardRepositoryIMPL: BoardRepository {
    let api: LaborLawAPI
    
    init(api: LaborLawAPI) {
        self.api = api
    }
    
    func createPost(_ request: BoardPostCreate) async -> Result<Void, LaborLawNetworkError> {
        let dto = CreateBoardRequestDTO(from: request)
        
        let result = await api.createPost(dto)
        
        return result.map { _ in }
    }
    
    func getAllCategories() async -> Result<[PostCategory], LaborLawNetworkError> {
        let result = await api.getAllCategories()
        
        return result.map { wrapper in
            wrapper.data.map { $0.toDomain() }
        }
    }
}
