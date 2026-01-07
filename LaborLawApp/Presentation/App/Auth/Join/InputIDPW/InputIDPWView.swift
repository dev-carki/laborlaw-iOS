//
//  InputIDPWView.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct InputIDPWView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = InputIDPWViewModel()
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(type: .back, text: "회원가입") {
                        self.presentationMode.wrappedValue.dismiss()
                        viewModel.dismiss()
                    }
                    
                    VStack(spacing: 16) {
                        CustomTextField(inputText: $viewModel.inputEmailText, placeHolderText: "이메일을 입력해주세요", iconName: "person.fill")
                            .onChange(of: $viewModel.inputEmailText.wrappedValue) {
                                self.viewModel.signUpViewModel.createUser.email = viewModel.inputEmailText
                            }
                        
                        CustomPasswordTextField(inputText: $viewModel.inputPWText, placeHolderText: "영문 대,소문자 / 숫자 / 특수문자 각 1개 이상")
                        
                        CustomPasswordTextField(inputText: $viewModel.inputConfirmPWText, placeHolderText: "비밀번호 확인")
                            .onChange(of: $viewModel.inputConfirmPWText.wrappedValue) {
                                self.viewModel.signUpViewModel.createUser.password = viewModel.inputConfirmPWText
                            }
                        
                        CustomButton(text: "다음") {
                            self.coordinator.push(destination: .inputUserInfo(signUpViewModel: viewModel.signUpViewModel))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    InputIDPWView()
}
