//
//  SplashView.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = SplashViewModel()
    @StateObject private var coordinator: Coordinator = Coordinator()
    var body: some View {
        NavigationView {
            Text("splash!")
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
//        .onChange(of: $vm.isAvailableToMoveMain.wrappedValue, perform: { value in
//            coordinator.moveToMain()
//        })
        .onChange(of: $viewModel.isAvailableToMoveLogin.wrappedValue, perform: { value in
            coordinator.moveToLogin()
        })
    }
}

#Preview {
    SplashView()
}
