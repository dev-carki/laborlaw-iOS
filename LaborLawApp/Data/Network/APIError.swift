//
//  APIError.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

enum ApiError: Error {
    case customError(data: Data)
    case serverError
    case parsingError
    case afError
    case timeoutError
}
