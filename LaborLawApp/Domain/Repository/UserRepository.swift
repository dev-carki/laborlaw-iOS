//
//  UserRepository.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

protocol UserRepository {
    func createUser(_ request: CreateUser) async -> Result<SignUpResult, LaborLawNetworkError>
}
