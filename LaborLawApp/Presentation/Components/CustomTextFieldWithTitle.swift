//
//  CustomTextFieldWithTitle.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct CustomTextFieldWithTitle: View {
    @Binding var inputText: String
    let titleText: String
    let placeHolderText: String?
    
    
    init(inputText: Binding<String>, titleText: String, placeHolderText: String?) {
        self._inputText = inputText
        self.titleText = titleText
        self.placeHolderText = placeHolderText
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .foregroundColor(CustomColor.customBlack)
                .font(Font.inputText)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .center, spacing: 8) {
                TextField("", text: $inputText)
                    .foregroundColor(CustomColor.customBlack)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.placeholderText)
                    })
                    .foregroundColor(CustomColor.customBlack)
                    .autocapitalization(.none)
                    .font(Font.inputText)
            }
            .padding(.all, 8)
            .background(CustomColor.customWhite)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColor.customGray400, lineWidth: 2)
            )
            .setCornerRadius(12, corners: .allCorners)
        }
    }
}

#Preview {
    CustomTextFieldWithTitle(inputText: .constant(""), titleText: "제목", placeHolderText: "dkdkdkdk")
}
