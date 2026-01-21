//
//  DIContainer.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation
import Factory

extension Container {
    var baseNetworkService: Factory<BaseNetworkservice> {
        Factory(self) { BaseNetworkservice() }
    }
    
    var userDefaultsManager: Factory<UserDefaultsManager> {
        Factory(self) { UserDefaultsManager() }
    }
}

extension Container {
    var laborLawNetworkService: Factory<LaborLawNetworkService> {
        Factory(self) { LaborLawNetworkService() }
    }
    
    var labowLawAPI: Factory<LaborLawAPI> {
        Factory(self) { LaborLawAPI(networkService: self.laborLawNetworkService(), host: AppConfig.apiBaseURL) }
    }
}

// MARK: Repository
extension Container {
    var userRepository: Factory<UserRepository> {
        Factory(self) { UserRepositoryIMPL(api: self.labowLawAPI()) }
    }
    
    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryIMPL(api: self.labowLawAPI()) }
    }
    
    var chatRepository: Factory<ChatRepository> {
        Factory(self) { ChatRepositoryIMPL(api: self.labowLawAPI()) }
    }
    
    var boardRepository: Factory<BoardRepository> {
        Factory(self) { BoardRepositoryIMPL(api: self.labowLawAPI()) }
    }
}

// MARK: UseCase - User
extension Container {
    var createUserUseCase: Factory<CreateUserUseCase> {
        Factory(self) { CreateUserUseCase(repository: self.userRepository()) }
    }
}

// MARK: UseCase - Auth
extension Container {
    var loginUseCase: Factory<LoginUseCase> {
        Factory(self) { LoginUseCase(repository: self.authRepository()) }
    }
}

// MARK: UseCase - RAG
extension Container {
    var chatUseCase: Factory<ChatUseCase> {
        Factory(self) { ChatUseCase(repository: self.chatRepository()) }
    }
    
    var getChatListUseCase: Factory<GetChatListUseCase> {
        Factory(self) { GetChatListUseCase(repository: self.chatRepository()) }
    }
    
    var getChatDetailUseCase: Factory<GetChatDetailUseCase> {
        Factory(self) { GetChatDetailUseCase(repository: self.chatRepository()) }
    }
}

// MARK: UseCase - Board
extension Container {
    var createPostUseCase: Factory<CreatePostUseCase> {
        Factory(self) { CreatePostUseCase(repository: self.boardRepository()) }
    }
    
    var getAllCategoriesUseCase: Factory<GetAllCategoriesUseCase> {
        Factory(self) { GetAllCategoriesUseCase(repository: self.boardRepository()) }
    }
    
    var getAllPostListUseCase: Factory<GetAllPostListUseCase> {
        Factory(self) { GetAllPostListUseCase(repository: self.boardRepository()) }
    }
}
