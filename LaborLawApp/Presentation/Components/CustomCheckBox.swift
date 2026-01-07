//
//  CustomCheckBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/8/26.
//

import SwiftUI

struct CustomCheckBox: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(isSelected ? CustomColor.customBlack : Color.clear)
                .frame(width: 16, height: 16)
                .overlay(
                    Rectangle()
                        .stroke(CustomColor.customBlack, lineWidth: 1)
                )
            
            Text(text)
                .font(Font.radioButtonText)
                .foregroundColor(CustomColor.customBlack)
        }
    }
}

#Preview {
    CustomCheckBox(text: "남자", isSelected: false)
}

