//
//  GetAllCategoriesResponseDTO.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

struct GetAllCategoriesResponseDTO: Codable {
    let id: Int
    let name: String
    
}

extension GetAllCategoriesResponseDTO {
    func toDomain() -> PostCategory {
        PostCategory(
            serverId: self.id,
            name: self.name
        )
    }
}
