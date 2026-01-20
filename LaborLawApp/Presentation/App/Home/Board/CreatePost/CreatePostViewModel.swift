//
//  CreatePostViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

import Factory

final class CreatePostViewModel: ObservableObject {
    @Injected(\.createPostUseCase) var createPostUseCase
    @Injected(\.getAllCategoriesUseCase) var getAllCategoriesUseCase
    
    @Published var titleText: String = ""
    @Published var contentsText: String = ""
    @Published var selectedCategory: PostCategory? = nil
    @Published var categories: [PostCategory] = []
    @Published var hashtags: [String] = []
    
    @Published var isCreatingPost: Bool = false
    @Published var isCreatingPostSuccess: Bool = false
    
    @Published var isLoadingCategories: Bool = false
    @Published var isLoadingCategoriesSuccess: Bool = true
    
    // Dropdown 상태
    @Published var isCategoryDropdownOpen: Bool = false
    
    @MainActor
    func createPost() async {
        self.isCreatingPost = true
        
        let result = await createPostUseCase.execute(
            BoardPostCreate(
                title: titleText,
                content: contentsText,
                categoryId: selectedCategory?.serverId,
                hashtags: hashtags
            )
        )
        
        switch result {
        case .success:
            self.isCreatingPostSuccess = true
        case .failure:
            self.isCreatingPostSuccess = false
        }
        
        
        self.isCreatingPost = false
    }
    
    @MainActor
    func getAllCategories() async {
        self.isLoadingCategories = true
        
        let result = await getAllCategoriesUseCase.execute()
        
        switch result {
        case .success(let response):
            self.isLoadingCategoriesSuccess = true
            self.categories = response
        case .failure:
            self.isLoadingCategoriesSuccess = false
            self.categories = []
        }
        
        self.isLoadingCategories = false
    }
}

