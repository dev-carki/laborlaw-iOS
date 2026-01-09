//
//  CustomPopupView.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import SwiftUI

struct CustomPopupView: View {
    let titleText: String
    let subTitleText: String?
    
    let buttonText: String
    let tapGesture: () -> ()
    
    init(titleText: String, subTitleText: String? = nil, buttonText: String, tapGesture: @escaping () -> ()) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        self.buttonText = buttonText
        self.tapGesture = tapGesture
    }
    
    var body: some View {
        ZStack {
            CustomColor.customBlack.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 16) {
                Text(titleText)
                    .foregroundColor(CustomColor.customBlack)
                    .font(Font.loadingViewTitleText)
                
                if let subTitle = subTitleText {
                    Text(subTitle)
                        .foregroundColor(CustomColor.customBlack)
                        .font(Font.loadingViewSubTitleText)
                }
                
                CustomButton(text: buttonText) {
                    tapGesture()
                }
            }
            .padding(.all, 16)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(CustomColor.customGray500)
            .cornerRadius(16)
            .padding(.horizontal, 16)
        }
        .transition(.opacity)
    }
}

#Preview {
    CustomPopupView(titleText: "타이틀", buttonText: "버튼 텍스트") {
        
    }
}
