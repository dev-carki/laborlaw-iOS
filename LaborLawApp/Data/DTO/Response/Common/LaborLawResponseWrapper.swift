//
//  LaborLawResponseWrapper.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

struct LaborLawResponseWrapper<T: Codable>: Codable {
    let code: Int
    let message: String
    let data: T
}
