//
//  Array+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
