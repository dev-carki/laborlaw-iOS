//
//  CustomSelectBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct CustomSelectBox: View {
    let title: String
    let selected: String?
    let placeholder: String
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(CustomColor.customBlack)
                .font(Font.inputText)
            
            HStack {
                ZStack {
                    if let selected {
                        Text(selected)
                            .font(Font.inputText)
                            .foregroundColor(CustomColor.customDarkgray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(placeholder)
                            .foregroundColor(CustomColor.customGray400)
                            .font(Font.placeholderText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    TextField("", text: .constant(""))
                        .disabled(true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "chevron.down")
                        .foregroundColor(CustomColor.customDarkgray)
                        .padding(.all, 4)
                }
            }
            .background(CustomColor.customWhite)
            .padding(.all, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColor.customGray400, lineWidth: 2)
            )
            .setCornerRadius(12, corners: .allCorners)
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    CustomSelectBox(title: "타이틀", selected: "소득세법", placeholder: "ㅁㄴㅇㄹ") {
        
    }
}
