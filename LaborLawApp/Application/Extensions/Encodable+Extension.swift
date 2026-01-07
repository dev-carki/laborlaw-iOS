//
//  Encodable+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return jsonObject as? [String: Any] ?? [:]
        } catch {
            print("Failed to convert Codable to dictionary: \(error)")
            return [:]
        }
    }
}
