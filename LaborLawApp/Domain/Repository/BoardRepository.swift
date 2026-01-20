//
//  BoardRepository.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import Foundation

protocol BoardRepository {
    func createPost(_ request: BoardPostCreate) async -> Result<Void, LaborLawNetworkError>
    func getAllCategories() async -> Result<[PostCategory], LaborLawNetworkError>
}
