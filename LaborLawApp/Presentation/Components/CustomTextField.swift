//
//  CustomTextField.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var inputText: String
    let placeHolderText: String?
    let iconName: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .center) {
                Image(systemName: iconName)
                    .padding(.all, 4)
            }
            
            TextField("", text: $inputText)
                .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                    Text(placeHolderText ?? "")
                        .foregroundColor(CustomColor.customGray400)
                        .font(Font.placeholderText)
                })
                .foregroundColor(CustomColor.customBlack)
                .autocapitalization(.none) // 대문자로 시작 방지
                .font(Font.inputText)
        }
        .padding(.all, 8)
        .background(CustomColor.customGray200)
        .setCornerRadius(8, corners: .allCorners)
    }
}

#Preview {
    VStack {
        CustomTextField(inputText: .constant(""), placeHolderText: "아이디를 입력하세요", iconName: "person.fill")
        CustomTextField(inputText: .constant(""), placeHolderText: "아이디를 입력하세요", iconName: "lock.fill")
    }
    .padding(.horizontal, 16)
}
