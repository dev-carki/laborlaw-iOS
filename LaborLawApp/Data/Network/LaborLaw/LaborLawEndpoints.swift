//
//  LaborLawEndpoints.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

final class LaborLawEndpoints {
    
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
