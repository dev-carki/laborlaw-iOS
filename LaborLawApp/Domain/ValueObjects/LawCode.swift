//
//  LawCode.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

enum LawCode: String, CaseIterable {
    case incomeTax = "INCOME_TAX"
    case laborStandards = "LABOR_STANDARDS"
    case employmentInsurance = "EMPLOYMENT_INSURANCE"
    case retirement_benefit = "RETIREMENT_BENEFIT"

    var displayName: String {
        switch self {
        case .incomeTax: 
            return "소득세법"
        case .laborStandards: 
            return "근로기준법"
        case .employmentInsurance: 
            return "고용보험법"
        case .retirement_benefit:
            return "근로자퇴직급여 보장법"
        }
    }
}
