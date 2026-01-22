//
//  PostReviewList.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

struct PostReviewList: Identifiable {
    let id: UUID
    let serverId: Int
    let contentText: String
    let nickName: String
    let createdAt: String
    
    init(id: UUID = UUID(), serverId: Int, contentText: String, nickName: String, createdAt: String) {
        self.id = id
        self.serverId = serverId
        self.contentText = contentText
        self.nickName = nickName
        self.createdAt = createdAt
    }
}
