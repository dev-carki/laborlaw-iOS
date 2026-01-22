//
//  PostDetailViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

import Factory

final class PostDetailViewModel: ObservableObject {
    @Injected(\.getPostDetailUseCase) var getPostDetailUseCase
    @Injected(\.createReviewUseCase) var createReviewUseCase
    @Injected(\.getReviewListUseCase) var getReviewListUseCase
    
    let postId: Int
    
    @Published var postData: PostDetail? = nil
    @Published var reviewData: [PostReviewList] = []
    
    @Published var reviewText: String = ""
    
    
    @Published var isGetPostDataLoading: Bool = false
    @Published var isLoadingGetPostSuccess: Bool = true
    
    init(postId: Int) {
        self.postId = postId
    }
    
    func loadInitialData() async {
        isGetPostDataLoading = true
        
        async let postTask: () = getPostDetailInternal()
        async let reviewTask: () = getReviewListInternal()
        
        await (postTask, reviewTask)
        
        isGetPostDataLoading = false
    }
    
    // MARK: - Internal Methods
    
    private func getPostDetailInternal() async {
        let result = await getPostDetailUseCase.execute(postId: postId)
        
        switch result {
        case .success(let response):
            postData = response
            isLoadingGetPostSuccess = true
        case .failure:
            postData = nil
            isLoadingGetPostSuccess = false
        }
    }
    
    private func getReviewListInternal() async {
        let result = await getReviewListUseCase.execute(postId: postId)
        
        switch result {
        case .success(let response):
            reviewData = response
        case .failure:
            reviewData = []
        }
    }
    
    // MARK: - Create Review
    
    func createReview() async {
        let result = await createReviewUseCase.execute(
            postId: postId,
            request: PostReviewCreate(reviewText: reviewText)
        )
        
        switch result {
        case .success:
            reviewText = ""
            await getReviewListInternal()
        case .failure:
            isLoadingGetPostSuccess = false
        }
    }
}
