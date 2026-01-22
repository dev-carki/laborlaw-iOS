//
//  InputReviewBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import SwiftUI

struct InputReviewBox: View {
    @Binding var inputText: String
    let keyboardType: UIKeyboardType
    let placeHolderText: String?
    let registerButtonClicked: () -> ()
    
    init(inputText: Binding<String>, keyboardType: UIKeyboardType = .default, placeHolderText: String?, registerButtonClicked: @escaping () -> ()) {
        self._inputText = inputText
        self.keyboardType = keyboardType
        self.placeHolderText = placeHolderText
        self.registerButtonClicked = registerButtonClicked
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 8) {
                TextField("", text: $inputText)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.placeholderText)
                            .keyboardType(keyboardType)
                    })
                    .foregroundColor(CustomColor.customBlack)
                    .autocapitalization(.none)
                    .font(Font.inputText)
                
                
                Button(action: {
                    registerButtonClicked()
                }) {
                    VStack {
                        Text("등록하기")
                            .foregroundColor(.white)
                            .font(.buttonText)
                    }
                    .padding(.all, 4)
                    .background(CustomColor.customGray700)
                }
            }
            .padding(.all, 8)
            .background(CustomColor.customWhite)
            .overlay(                          
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(CustomColor.customGray300),
                alignment: .top
            )
        }
    }
}

#Preview {
    VStack {
        InputReviewBox(inputText: .constant("ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹ"), keyboardType: .numberPad, placeHolderText: "아이디를 입력하세요") {
            
        }
    }
    .padding(.horizontal, 16)
}
