//
//  ContentsBoxButton.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct ContentsBoxButton: View {
    let iconName: String?
    let text: String
    
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
                .stroke(CustomColor.customGray200, lineWidth: 2)
        )
        .background(CustomColor.customGray200)
        .setCornerRadius(8, corners: .allCorners)
    }
}

#Preview {
    ContentsBoxButton(iconName: "creditcard.fill", text: "소득세법")
}
