//
//  PostCategory.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

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
