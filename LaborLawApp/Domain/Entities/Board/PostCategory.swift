//
//  PostCategory.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

enum PostCategoryEnum: Int {
    case incomeTaxLaw = 2
    case laborStandardsAct = 1
    case employeeRetirementBenefitsAct = 4
    case employmentInsuranceAct = 3

    var title: String {
        switch self {
        case .incomeTaxLaw:
            return "소득세법"
        case .laborStandardsAct:
            return "근로기준법"
        case .employeeRetirementBenefitsAct:
            return "근로자퇴직급여 보장법"
        case .employmentInsuranceAct:
            return "고용보험법"
        }
    }

    var color: Color {
        switch self {
        case .incomeTaxLaw:
            return CustomColor.incomeTaxLawColor
        case .laborStandardsAct:
            return CustomColor.laborStandardsActColor
        case .employeeRetirementBenefitsAct:
            return CustomColor.employeeRetirementBenefitsActColor
        case .employmentInsuranceAct:
            return CustomColor.employmentInsuranceActColor
        }
    }
}

struct PostCategory: Identifiable, Equatable {
    let id: UUID
    let serverId: Int
    let name: String
    
    init(
        id: UUID = UUID(),
        serverId: Int,
        name: String
    ) {
        self.id = id
        self.serverId = serverId
        self.name = name
    }
}
