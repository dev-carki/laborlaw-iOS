//
//  BoardMainViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

import Factory

final class BoardMainViewModel: ObservableObject {
    @Injected(\.getAllPostListUseCase) var getAllPostListUseCase
    
    @Published var postDatas: [PostList] = []
    
    @Published var isLoadingPostData: Bool = false
    @Published var isLoadingPostDataSuccess: Bool = true
    
    @MainActor
    func getAllPostList() async {
        self.isLoadingPostData = true
        
        let result = await self.getAllPostListUseCase.execute()
        
        switch result {
        case .success(let response):
            self.postDatas = response
            self.isLoadingPostDataSuccess = true
        case .failure:
            self.postDatas = []
            self.isLoadingPostDataSuccess = false
        }
            
        self.isLoadingPostData = false
    }
}
