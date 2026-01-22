//
//  SelectBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/19/26.
//

import SwiftUI

struct SelectBox: View {
    let iconName: String?
    let text: String
    
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            if let icon = iconName {
                Circle()
                    .stroke(CustomColor.customBlack, lineWidth: 1)
                    .foregroundColor(.clear)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(CustomColor.customDarkgray)
                            .padding(.all, 8)
                    )
            }
            
            
            Text(text)
                .font(Font.placeholderText)
                .foregroundColor(CustomColor.customBlack)
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? CustomColor.customGray500 : CustomColor.customGray100, lineWidth: 1)
        )
        .background(isSelected ? CustomColor.customGray200 : CustomColor.customGray100)
        .setCornerRadius(8, corners: .allCorners)
    }
}

#Preview {
    SelectBox(iconName: "creditcard.fill", text: "소득세법", isSelected: true)
        .padding(.horizontal, 16)
}
