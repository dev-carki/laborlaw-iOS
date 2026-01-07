//
//  AuthMainView.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct AuthMainView: View {
    @StateObject private var viewModel = AuthMainViewModel()
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [
            CustomColor.customBlack,
            CustomColor.customDarkgray,
            CustomColor.customGray600,
            CustomColor.customDarkgray,
            CustomColor.customBlack
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
        }
    }
}

#Preview {
    AuthMainView()
}
