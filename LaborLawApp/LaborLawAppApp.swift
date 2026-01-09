//
//  LaborLawAppApp.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

@main
struct LaborLawAppApp: App {
    @StateObject var coordinator = Coordinator(isRoot: true)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    Color.white
                    coordinator.navigationLinkSection()
                    
                    switch coordinator.rootState {
                    case .home:
                        HomeView()
                            .transition(.opacity)
                            .onAppear {
                                print("[SD] appear home view")
                            }
                    case .login:
                        LoginView()
                            .transition(.opacity.combined(with: .scale(scale: 0.95)))
                            .onAppear {
                                print("[SD] appear login view")
                            }
                    case .splash:
                        SplashView()
                            .transition(.opacity.combined(with: .scale))
                            .onAppear {
                                print("[SD] appear splash view")
                            }
                    }
                }
                .animation(.easeInOut(duration: 0.35), value: coordinator.rootState)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()
            }
            .navigationViewStyle(.stack)
        }
    }
}
