//
//  Coordinator.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation
import Combine
import SwiftUI

enum RootState {
    case home
    case login
    case splash
}

final class Coordinator: ObservableObject {
    private var isRoot: Bool
    
    var cancellable = Set<AnyCancellable>()
    var destination: Destination? = nil
    
    @Published private var navigationTrigger = false
    @Published private var rootNavigationTrigger = false
    @Published var rootState: RootState = .splash
    
    init(isRoot: Bool = false) {
        self.isRoot = isRoot
        
        if isRoot {
            NotificationCenter.default.publisher(for: .popToRoot)
                .sink { [unowned self] _ in
                    rootNavigationTrigger = false
                }
                .store(in: &cancellable)
            NotificationCenter.default.publisher(for: .moveToHome)
                .sink { [unowned self] _ in
                    self.rootState = .home
                    self.popToRoot()
                }
                .store(in: &cancellable)
            NotificationCenter.default.publisher(for: .moveToSplash)
                .sink { [unowned self] _ in
                    self.rootState = .splash
                    self.popToRoot()
                }
                .store(in: &cancellable)
            NotificationCenter.default.publisher(for: .moveToLogin)
                .sink { [unowned self] _ in
                    self.rootState = .login
                    self.popToRoot()
                }
                .store(in: &cancellable)
        }
    }
    
    @ViewBuilder
    func navigationLinkSection() -> some View {
        NavigationLink(isActive: Binding<Bool>(get: getTrigger, set: setTrigger(newValue:))) {
            self.destination?.view
        } label: {
            EmptyView()
        }
    }
    
    
    func popToRoot() {
        NotificationCenter.default.post(name: .popToRoot, object: nil)
    }
    
    func moveToMain() {
        NotificationCenter.default.post(name: .moveToHome, object: nil)
    }
    
    func moveToSplash() {
        NotificationCenter.default.post(name: .moveToSplash, object: nil)
    }
    
    func moveToLogin() {
        NotificationCenter.default.post(name: .moveToLogin, object: nil)
    }
    
    func push(destination: Destination) {
        self.destination = destination
        if isRoot {
            rootNavigationTrigger.toggle()
        } else {
            navigationTrigger.toggle()
        }
    }
    
    private func getTrigger() -> Bool {
        isRoot ? rootNavigationTrigger : navigationTrigger
    }
    
    private func setTrigger(newValue: Bool) {
        if isRoot {
            rootNavigationTrigger = newValue
        } else {
            navigationTrigger = newValue
        }
    }
}

extension Notification.Name {
    static let popToRoot = Notification.Name("PopToRoot")
    static let moveToHome = Notification.Name("moveToHome")
    static let moveToSplash = Notification.Name("MoveToSplash")
    static let moveToLogin = Notification.Name("MoveToLogin")
}

extension Coordinator {
    static var preview: Coordinator {
        Coordinator(isRoot: false)
    }
}
