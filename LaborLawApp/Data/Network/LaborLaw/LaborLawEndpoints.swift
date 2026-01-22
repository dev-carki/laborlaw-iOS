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

// MARK: Board
extension LaborLawEndpoints {
    enum Board: EndPoint {
        case getAllPost
        case createPost
        case getUserPost
        case getPostDetail(post_id: Int)
        case createReview(post_id: Int)
        case getReview(post_id: Int)
        case getAllCategories
        
        var url: String {
            switch self {
            case .getAllPost:
                return "/api/v1/board/posts"
            case .createPost:
                return "/api/v1/board/posts"
            case .getUserPost:
                return "/api/v1/board/posts/me"
            case .getPostDetail(let id):
                return "/api/v1/board/posts/\(id)"
            case .createReview(let id):
                return "/api/v1/board/posts/\(id)/reviews"
            case .getReview(let id):
                return "/api/v1/board/posts/\(id)/reviews"
            case .getAllCategories:
                return "/api/v1/board/categories"
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
