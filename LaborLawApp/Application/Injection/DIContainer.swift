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
}

// MARK: UseCase
extension Container {
    var createUserUseCase: Factory<CreateUserUseCase> {
        Factory(self) { CreateUserUseCase(repository: self.userRepository()) }
    }
    
    var loginUseCase: Factory<LoginUseCase> {
        Factory(self) { LoginUseCase(repository: self.authRepository()) }
    }
    
    var chatUseCase: Factory<ChatUseCase> {
        Factory(self) { ChatUseCase(repository: self.chatRepository()) }
    }
}
