//
//  ChatMessage.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

enum ChatRole {
    case user
    case ai
    
    var roleName: String {
        switch self {
        case .user:
            return "당신"
        case .ai:
            return "AI"
        }
    }
}

enum ChatMessageState {
    case loading
    case streaming
    case done
}

struct ChatMessage: Identifiable {
    let id: UUID
    let role: ChatRole
    var text: String
    var state: ChatMessageState

    init(
        id: UUID = UUID(),
        role: ChatRole,
        text: String,
        state: ChatMessageState
    ) {
        self.id = id
        self.role = role
        self.text = text
        self.state = state
    }
}
