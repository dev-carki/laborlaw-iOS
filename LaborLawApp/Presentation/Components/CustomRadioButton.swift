//
//  CustomRadioButton.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct CustomRadioButton: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(isSelected ? CustomColor.customBlack : Color.clear)
                .frame(width: 16, height: 16)
                .overlay(
                    Circle()
                        .stroke(CustomColor.customBlack, lineWidth: 1)
                )
            
            Text(text)
                .font(Font.radioButtonText)
                .foregroundColor(CustomColor.customBlack)
        }
    }
}

#Preview {
    CustomRadioButton(text: "남자", isSelected: false)
}
