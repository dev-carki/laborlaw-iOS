//
//  Gender.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
    
    var displayName: String {
        switch self {
        case .male:
            return "남성"
        case .female:
            return "여성"
        }
    }
}
