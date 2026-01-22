//
//  ChatListViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import Foundation

import Factory

final class ChatListViewModel: ObservableObject {
    @Injected(\.getChatListUseCase) var getChatListUseCase
    @Published var chatListData: [ChatList] = []
    @Published var isLoading: Bool = false
    @Published var isSuccess: Bool = false
    
    func getChatList() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isLoading = true
        }
        
        let result = await getChatListUseCase.execute()
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.isSuccess = true
                self.chatListData = response
                
                
            case .failure:
                self.isSuccess = false
                self.chatListData = []
            }
            
            self.isLoading = false
        }
    }
}
