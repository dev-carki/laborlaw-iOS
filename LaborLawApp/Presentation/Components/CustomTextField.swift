//
//  CustomTextField.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var inputText: String
    let keyboardType: UIKeyboardType
    let placeHolderText: String?
    let iconName: String?
    
    init(inputText: Binding<String>, keyboardType: UIKeyboardType = .default, placeHolderText: String?, iconName: String?) {
        self._inputText = inputText
        self.keyboardType = keyboardType
        self.placeHolderText = placeHolderText
        self.iconName = iconName
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            if let icon = iconName {
                VStack(alignment: .center) {
                    Image(systemName: icon)
                        .padding(.all, 4)
                }
            }
            
            TextField("", text: $inputText)
                .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                    Text(placeHolderText ?? "")
                        .foregroundColor(CustomColor.customGray400)
                        .font(Font.placeholderText)
                        .keyboardType(keyboardType)
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
        CustomTextField(inputText: .constant(""), keyboardType: .numberPad, placeHolderText: "아이디를 입력하세요", iconName: "person.fill")
        CustomTextField(inputText: .constant(""), keyboardType: .numberPad, placeHolderText: "아이디를 입력하세요", iconName: "lock.fill")
    }
    .padding(.horizontal, 16)
}
