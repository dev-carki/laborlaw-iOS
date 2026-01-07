//
//  LaborLawNetworkError.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

enum LaborLawNetworkError: String, Error {
    //MARK: COMMON
    case UNKNOWN
    case PARSING
    case AFERROR
    
    func toNetworkError() -> NetworkError {
        return NetworkError(rawValue: self.rawValue) ?? NetworkError.UNKNOWN
    }
}

