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
    let cancelButtonText: String?
    let tapGesture: () -> ()
    let cancelGesture: (() -> ())?
    
    init(
        titleText: String,
        subTitleText: String? = nil,
        buttonText: String,
        tapGesture: @escaping () -> Void,
        cancelButtonText: String? = nil,
        cancelGesture: (() -> Void)? = nil
    ) {
        if cancelButtonText != nil {
            precondition(cancelGesture != nil, "cancelButtonText가 있으면 cancelGesture는 필수")
        }

        self.titleText = titleText
        self.subTitleText = subTitleText
        self.buttonText = buttonText
        self.tapGesture = tapGesture
        self.cancelButtonText = cancelButtonText
        self.cancelGesture = cancelGesture
    }
    
    var body: some View {
        ZStack {
            CustomColor.customDarkgray.opacity(0.4).ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 16) {
                Text(titleText)
                    .foregroundColor(CustomColor.customBlack)
                    .font(Font.loadingViewTitleText)
                
                if let subTitle = subTitleText {
                    Text(subTitle)
                        .foregroundColor(CustomColor.customBlack)
                        .font(Font.loadingViewSubTitleText)
                }
                
                HStack(spacing: 12) {
                    if let cancelButtonText,
                       let cancelGesture {
                        CustomButton(text: cancelButtonText, backgroundColor: CustomColor.fail) {
                            cancelGesture()
                        }
                    }
                    CustomButton(text: buttonText) {
                        tapGesture()
                    }
                }
            }
            .padding(.all, 16)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(CustomColor.customGray100)
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
