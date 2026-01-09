//
//  SplashViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

final class SplashViewModel: ObservableObject {
    @Published var isAvailableToMoveLogin: Bool = false
    
    @MainActor
    init() {
        doTask()
    }
    
    @MainActor
    func doTask()  {
        Task {
            // 1초 타이머
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            self.isAvailableToMoveLogin = true
        }
    }
    
    deinit {
        print("deinit splash")
    }
}
