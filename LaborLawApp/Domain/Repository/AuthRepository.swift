//
//  AuthRepository.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

protocol AuthRepository {
    func login(_ request: Login) async -> Result<LoginResult, LaborLawNetworkError>
}
