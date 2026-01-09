//
//  LaborLawErrorResponse.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

struct LaborLawErrorResponse: Error, Codable {
    let code: String
    let message: String
    let status: Int
    let success: Bool
}
