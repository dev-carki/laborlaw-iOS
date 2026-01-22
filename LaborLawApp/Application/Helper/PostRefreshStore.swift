//
//  PostRefreshStore.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import Foundation

final class PostRefreshStore: ObservableObject {
    @Published var shouldRefreshBoard: Bool = false
}

