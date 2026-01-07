//
//  LaborLawAPI.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

class LaborLawAPI {
    var host: String
    let networkService: LaborLawNetworkService
    
    init(networkService: LaborLawNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}

// MARK: User
extension LaborLawAPI {
    func createUser(_ request: CreateUserRequestDTO) async -> Result<LaborLawResponseWrapper<CreateUserResponseDTO>, LaborLawNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: LaborLawEndpoints.User.CreateUser.url, httpBody: body)
    }
}

//// MARK: Auth
//extension LaborLawAPI {
//    func create_user(_ request: CreateStoreRequestModel) async -> Result<MenuBoardResponseWrapper<CreateStoreResponseModel>, LaborLawNetworkError> {
//        let body = request.toDictionary()
//        return await self.networkService.post(self.host, url: CodeitEndpoints.Store.CreateStore.url, httpBody: body)
//    }
//}
