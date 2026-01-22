//
//  PostDetail.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import Foundation

struct PostDetail: Identifiable {
    let id: UUID
    let serverId: Int
    let titleText: String
    let contentText: String
    let category: Int
    let nickName: String
    let createdAt: String
    
    init(id: UUID = UUID(), serverId: Int, titleText: String, contentText: String, category: Int, nickName: String, createdAt: String) {
        self.id = id
        self.serverId = serverId
        self.titleText = titleText
        self.contentText = contentText
        self.category = category
        self.nickName = nickName
        self.createdAt = createdAt
    }
}
