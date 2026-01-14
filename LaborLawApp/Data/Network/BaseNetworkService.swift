//
//  BaseNetworkService.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation
import Combine
import Alamofire
import UIKit
import Factory

enum JSONDecoderFactory {
    static let iso8601: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

class BaseNetworkservice {
    let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 5 * 60
        configuration.waitsForConnectivity = true
        
        return Session(
            configuration: configuration
        )
    }()
}


//MARK: Concurrency
extension BaseNetworkservice {
    
    func request<T>(
        _ host: String,
        url: String,
        auth: Bool,
        method: HTTPMethod,
        headers requestHeaders: [String: String]? = nil,
        parameters: Parameters? = nil,
        httpBody: Any? = nil
    ) async -> Result<T, ApiError> where T: Codable {
        var headers: HTTPHeaders = HTTPHeaders()
        headers.add(name: "content-Type", value: "application/json")
        headers.add(name: "accept", value: "application/json")
        
        if let headerItems = requestHeaders {
            headerItems.forEach { (key: String, value: String) in
                headers.add(name: key, value: value)
            }
        }
        
        let baseURL = host + url
        var request = self.session
            .request(baseURL, method: method, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .cURLDescription { description in
                print(description)
            }
        
        
        if let data = httpBody, var req = try? request.convertible.asURLRequest() {
            if let body = try? JSONSerialization.data(withJSONObject: data, options: []) {
                req.httpBody = body
            }
            req.timeoutInterval = 5 * 60
            request = AF.request(req)
                .cURLDescription { description in
                    print(description)
                }
        }
        
        let dataTask = request
            .validate(statusCode: 200..<300)
            .serializingDecodable(
                T.self,
                decoder: JSONDecoderFactory.iso8601
            )
            


        switch await dataTask.result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            print("------------🔺FAIL🔺------------")
            print("🔺\(error)")
            print("---------------------------------")
            if let data = await dataTask.response.data {
                return .failure(ApiError.customError(data: data))
            }
            return .failure(ApiError.afError)
        }
    }
    
    
    func uploadFormData<T>(
        _ host: String,
        url: String,
        auth: Bool,
        method: HTTPMethod,
        headers requestHeaders: [String: String]? = nil,
        body: MultipartFormData
    ) async -> Result<T, ApiError> where T: Codable {
        var headers: HTTPHeaders = HTTPHeaders()
        headers.add(name: "content-Type", value: "application/json")
        headers.add(name: "accept", value: "application/json")
        
        if let headerItems = requestHeaders {
            headerItems.forEach { (key: String, value: String) in
                headers.add(name: key, value: value)
            }
        }
        
        let baseURL = host + url
        
        var urlRequest: URLRequest
        do {
            urlRequest = try URLRequest(url: baseURL, method: method, headers: headers)
        } catch {
            print("[ERROR!]: \(error)")
            return .failure(ApiError.parsingError)
        }
        // urlRequest.timeoutInterval = 10
        urlRequest.timeoutInterval = 5 * 60

        
        let request = self.session.upload(multipartFormData: body, with: urlRequest)
            .cURLDescription { description in
                print(description)
            }
        
        let dataTask = request
            .validate(statusCode: 200..<300)
            .serializingDecodable(T.self)


        switch await dataTask.result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            print("------------🔺FAIL🔺------------")
            print("🔺\(error)")
            print("---------------------------------")
            if let data = await dataTask.response.data {
                return .failure(ApiError.customError(data: data))
            }
            return .failure(ApiError.afError)
        }
    }
}

