//
//  LoginView.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject var coordinator = Coordinator()
            
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    coordinator.navigationLinkSection()
                    CustomTextField(inputText: $viewModel.loginData.id, placeHolderText: "아이디를 입력하세요", iconName: "person.fill")
                    CustomPasswordTextField(inputText: $viewModel.loginData.pw, placeHolderText: "비밀번호를 입력하세요")
                    CustomButton(text: "로그인") {
                        Task {
                            await viewModel.login()
                        }
                    }
                    .padding(.top, 8)
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 1)
                        
                        Text("OR")
                            .font(Font.regularText)
                            .foregroundColor(CustomColor.customDarkgray)
                            .padding(.horizontal, 4)
                            .background(CustomColor.customWhite)
                    }
                    
                    HStack(alignment: .center, spacing: 36) {
                        Image("apple_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                        
                        Image("google_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                        
                        Image("google_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                    }
                }
                .padding(.horizontal, 16)
                
                VStack {
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 4) {
                        Text("계정이 없으신가요?")
                            .foregroundColor(CustomColor.customBlack)
                            .font(Font.regularText)
                        
                        Text("계정 생성하기")
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.regularText)
                            .padding(.bottom, 0) // 텍스트와 밑줄 사이 간격
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .foregroundColor(CustomColor.customGray400)
                                    .frame(height: 1)
                            }
                            .onTapGesture {
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
