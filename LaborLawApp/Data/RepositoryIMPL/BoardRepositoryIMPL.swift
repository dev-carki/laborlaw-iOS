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
    
    func getAllPostList() async -> Result<[PostList], LaborLawNetworkError> {
        let result = await api.getAllPostList()
        
        return result.map { wrapper in
            wrapper.data.map { $0.toDomain() }
        }
    }
    
    func getPostDetail(postId: Int) async -> Result<PostDetail, LaborLawNetworkError> {
        let result = await api.getPostDetail(id: postId)
        
        return result.map { wrapper in
            wrapper.data.toDomain()
        }
    }
    
    func createReview(postId: Int, request: PostReviewCreate) async -> Result<Void, LaborLawNetworkError> {
        let dto = CreateReviewRequestDTO(from: request)
        
        let result = await api.createReview(id: postId, request: dto)
        
        return result.map{ _ in }
    }
    
    func getReviewList(postId: Int) async -> Result<[PostReviewList], LaborLawNetworkError> {
        let result = await api.getReviewList(id: postId)
        
        return result.map { wrapper in
            wrapper.data.map{ $0.toDomain() }
        }
    }
}
