//
//  NetworkError.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

enum NetworkError: String, Error {
    //MARK: COMMON
    case UNKNOWN = "UNKNOWN"
    case AFERROR = "AFERROR"
    case PARSING = "PARSING"
    
    case NO_DATA = "AUTH_404_1"
}

extension NetworkError {
    var errorMessage: String {
        switch self {
        case .UNKNOWN:
            return "알 수 없는 오류입니다."
        case .AFERROR:
            return "네트워크를 확인해주세요."
        case .PARSING:
            return "정확한 정보를 입력 후 다시 시도해주세요."
        case .NO_DATA:
            return "유효하지 않은 인증 토큰입니다."
        }
    }
}
