//
//  CustomTextEditor.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String

    let titleText: String
    let placeholder: String
    let minHeight: CGFloat
    let maxHeight: CGFloat
    let maxTextLength: Int
    
    @State private var dynamicHeight: CGFloat

    init(
        text: Binding<String>,
        titleText: String,
        placeholder: String,
        minHeight: CGFloat = 120,
        maxHeight: CGFloat = 240,
        maxTextLength: Int = 500
    ) {
        self._text = text
        self.titleText = titleText
        self.placeholder = placeholder
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.maxTextLength = maxTextLength
        self._dynamicHeight = State(initialValue: minHeight)
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .foregroundColor(CustomColor.customBlack)
                .font(Font.inputText)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            UITextViewWrapper(
                text: $text,
                placeholder: placeholder,
                calculatedHeight: $dynamicHeight,
                maxHeight: maxHeight,
                maxTextLength: maxTextLength
            )
            .frame(
                height: min(max(dynamicHeight, minHeight), maxHeight)
            )
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColor.customGray400, lineWidth: 2)
            )
            .setCornerRadius(12, corners: .allCorners)
        }
    }
}

#Preview {
    CustomTextEditor(text: .constant(""), titleText: "title", placeholder: "sadfiojaisdfj")
}
