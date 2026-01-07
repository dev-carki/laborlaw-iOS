//
//  CustomPasswordTextField.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct CustomPasswordTextField: View {
    @Binding var inputText: String
    @State private var isShowPassword: Bool = false
    @State private var textFieldOpacity: Double = 0.0
    @State private var passwordFieldOpacity: Double = 1.0
    let placeHolderText: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .center) {
                Image(systemName: "lock.fill")
            }
            .frame(width: 24, height: 24)
            
            if isShowPassword {
                TextField("", text: $inputText)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.placeholderText)
                    })
                    .foregroundColor(CustomColor.customBlack)
                    .autocapitalization(.none) // 대문자로 시작 방지
                    .font(Font.inputText)
                    .opacity(textFieldOpacity)
            } else {
                SecureField("", text: $inputText)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.placeholderText)
                    })
                    .foregroundColor(CustomColor.customBlack)
                    .autocapitalization(.none) // 대문자로 시작 방지
                    .font(Font.inputText)
                    .opacity(passwordFieldOpacity)
            }
            
            
            VStack(alignment: .center) {
                Image(systemName: isShowPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(CustomColor.customGray700)
                    .onTapGesture {
                        $isShowPassword.wrappedValue.toggle()
                    }
            }
            .frame(width: 24, height: 24)
        }
        .padding(.all, 8)
        .background(CustomColor.customGray200)
        .setCornerRadius(8, corners: .allCorners)
        .onChange(of: isShowPassword) { _ in
            if isShowPassword {
                textFieldOpacity = 1.0
                passwordFieldOpacity = 0.0
            } else {
                textFieldOpacity = 0.0
                passwordFieldOpacity = 1.0
            }
        }
    }
}

#Preview {
    VStack {
        CustomTextField(inputText: .constant(""), keyboardType: .default, placeHolderText: "아이디를 입력하세요", iconName: "person.fill")
        CustomPasswordTextField(inputText: .constant(""), placeHolderText: "비밀번호를 입력하세요")
    }
    .padding(.horizontal, 16)
    
}
