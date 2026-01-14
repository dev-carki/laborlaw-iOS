//
//  LaborLawEndpoints.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

final class LaborLawEndpoints {
}

// MARK: Chat
extension LaborLawEndpoints {
    enum RAG: EndPoint {
        case chat
        case chatList
        case chatDetail(id: Int)
        
        var url: String {
            switch self {
            case .chat:
                return "/api/v1/chat"
            case .chatList:
                return "/api/v1/conversations"
            case .chatDetail(let id):
                return "/api/v1/conversations/\(id)"
            }
        }
    }
}

// MARK: User
extension LaborLawEndpoints {
    enum User: EndPoint {
        case CreateUser
        
        var url: String {
            switch self {
            case .CreateUser:
                return "/api/v1/users"
            }
        }
    }
}

// MARK: Auth
extension LaborLawEndpoints {
    enum Auth: EndPoint {
        case login
        
        var url: String {
            switch self {
            case .login:
                return "/api/v1/login"
            }
        }
    }
}
