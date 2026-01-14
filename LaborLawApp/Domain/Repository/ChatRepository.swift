//
//  ChatRepository.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

protocol ChatRepository {
    func chat(_ request: ChatAnswer) async -> Result<ChatAnswer, LaborLawNetworkError>
    func getChatList() async -> Result<[ChatList], LaborLawNetworkError>
    func getChatDetail(id: Int) async -> Result<[ChatMessage], LaborLawNetworkError>
}
