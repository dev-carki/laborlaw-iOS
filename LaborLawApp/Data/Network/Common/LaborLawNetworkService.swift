//
//  LaborLawNetworkService.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation
import Alamofire
import Factory

class LaborLawNetworkService: BaseNetworkservice {
    
    private func afErrorConverter(_ afError: AFError) -> LaborLawNetworkError {
        return LaborLawNetworkError.AFERROR
    }
    
    private func decodeError(_ apiError: ApiError) -> LaborLawNetworkError {
        switch apiError {
        case .customError(let data):
            if let failResponse: LaborLawErrorResponse = try? JSONDecoder().decode(LaborLawErrorResponse.self, from: data) {
                return LaborLawNetworkError(rawValue: failResponse.code) ?? LaborLawNetworkError.AFERROR
            }
            return LaborLawNetworkError.AFERROR
        default:
            return LaborLawNetworkError.AFERROR
        }
    }
    
    func get<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil) async -> Result<T, LaborLawNetworkError> where T: Codable {
        var headers: [String: String] = [:]
        
        return await request(host, url: url, auth: auth, method: .get, headers: headers, parameters: parameters, httpBody: nil).mapError { apiError in
            self.decodeError(apiError)
        }
    }
    
    func post<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil, httpBody: Any? = nil) async -> Result<T, LaborLawNetworkError> where T: Codable {
        var headers: [String: String] = [:]
        
        // MARK: Header Param 필요시
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        
        return await request(host, url: url, auth: auth, method: .post, headers: headers, parameters: parameters, httpBody: httpBody).mapError {
            return self.decodeError($0)
        }
    }
    
    func patch<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil, httpBody: Any? = nil) async -> Result<T, LaborLawNetworkError> where T: Codable {
        var headers: [String: String] = [:]
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        
        return await request(host, url: url, auth: auth, method: .patch, headers: headers, parameters: parameters, httpBody: httpBody).mapError { apiError in
            self.decodeError(apiError)
        }
    }
    
    func upload<T>(_ host: String, url: String, auth: Bool = false, body: MultipartFormData) async -> Result<T, LaborLawNetworkError> where T: Codable {
        var headers: [String: String] = [:]
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        print("headers: \(headers)")
        return await uploadFormData(host, url: url, auth: auth, method: .post, headers: headers, body: body).mapError { apiError in
            self.decodeError(apiError)
        }
    }
}
