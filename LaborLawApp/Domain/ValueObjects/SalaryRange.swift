//
//  SalaryRange.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

enum SalaryRange: String, CaseIterable {
    case salary20to50 = "SALARY_20_50"
    case salary50to100 = "SALARY_50_100"
    case salary100up = "SALARY_100_UP"
    case salaryEtc = "SALARY_ETC"
    
    var displayName: String {
        switch self {
        case .salary20to50:
            return "2천만원 이상 5천만원 미만"
        case .salary50to100:
            return "5천만원 이상 1억원 미만"
        case .salary100up:
            return "1억 이상"
        case .salaryEtc:
            return "기타"
        }
    }
}
