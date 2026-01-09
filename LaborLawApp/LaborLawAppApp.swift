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
                            .onAppear {
                                print("[SD] appear home view")
                            }
                    case .login:
                        LoginView()
                            .onAppear {
                                print("[SD] appear login view")
                            }
                    case .splash:
                        SplashView()
                            .onAppear {
                                print("[SD] appear splash view")
                            }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()
            }
            .navigationViewStyle(.stack)
        }
    }
}
