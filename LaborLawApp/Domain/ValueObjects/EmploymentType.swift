//
//  EmploymentType.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

enum EmploymentType: String, CaseIterable {
    case employee = "EMPLOYEE"
    case freelancer = "FREELANCER"
    case owner = "BUSINESS_OWNER"
    case etc = "ETC"
    
    var displayName: String {
        switch self {
        case .employee:
            return "근로자"
        case .freelancer:
            return "프리렌서"
        case .owner:
            return "고용주"
        case .etc:
            return "기타"
        }
    }
}
