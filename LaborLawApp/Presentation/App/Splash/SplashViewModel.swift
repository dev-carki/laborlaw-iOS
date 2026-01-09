//
//  SplashViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import Foundation

final class SplashViewModel: ObservableObject {
    // @Injected(\.autoLoginUseCase) var autoLoginUseCase
    @Published var isAvailableToMoveMain: Bool = false
    @Published var isAvailableToMoveLogin: Bool = false
    
    @MainActor
    init() {
        doTask()
    }
    
    deinit {
        print("deinit splash")
    }
    
    @MainActor
    func doTask()  {
        Task {
            // 1초 타이머
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            self.isAvailableToMoveLogin = true
        }
    }
    
    @MainActor
    func autoLogin() {
        self.isAvailableToMoveMain = false
        self.isAvailableToMoveLogin = true
        //TODO: 오토 로그인
//        Task {
//            let result = await self.autoLoginUseCase.execute()
//            switch result {
//            case .success(_):
//                self.isAvailableToMoveMain = true
//            case .failure(let failure):
//                print("fail: \(failure)")
//                self.isAvailableToMoveLogin = true
//            }
//        }
    }
}
