//
//  ChatRepository.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

protocol ChatRepository {
    func chat(_ request: String) async -> Result<ChatAnswer, LaborLawNetworkError>
}
