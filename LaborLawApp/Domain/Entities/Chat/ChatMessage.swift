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
    
    init(from serverValue: String) {
        switch serverValue.lowercased() {
        case "user":
            self = .user
        case "assistant", "ai":
            self = .ai
        default:
            self = .ai
        }
    }
    
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
    let serverId: Int?
    let role: ChatRole
    var text: String
    let createdAt: String?
    var state: ChatMessageState = .done

    init(
        id: UUID = UUID(),
        serverId: Int? = nil,
        role: ChatRole,
        text: String,
        createdAt: String? = nil,
        state: ChatMessageState = .done
    ) {
        self.id = UUID()
        self.serverId = serverId
        self.role = role
        self.text = text
        self.createdAt = createdAt
        self.state = state
    }
}
