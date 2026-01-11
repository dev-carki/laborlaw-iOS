//
//  InputChatBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import SwiftUI

struct InputChatBox: View {
    @Binding var inputText: String
    let keyboardType: UIKeyboardType
    let placeHolderText: String?
    let sendButtonClicked: () -> ()
    
    init(inputText: Binding<String>, keyboardType: UIKeyboardType = .default, placeHolderText: String?, sendButtonClicked: @escaping () -> ()) {
        self._inputText = inputText
        self.keyboardType = keyboardType
        self.placeHolderText = placeHolderText
        self.sendButtonClicked = sendButtonClicked
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
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
            
            VStack {
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 24, height: 24)
            .onTapGesture {
                sendButtonClicked()
            }
        }
        .padding(.all, 8)
        .background(CustomColor.customWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(CustomColor.customGray400, lineWidth: 2)
        )
        .setCornerRadius(8, corners: .allCorners)
    }
}

#Preview {
    VStack {
        InputChatBox(inputText: .constant("ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹ"), keyboardType: .numberPad, placeHolderText: "아이디를 입력하세요") {
            
        }
    }
    .padding(.horizontal, 16)
}
