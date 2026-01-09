//
//  CustomLoadingView.swift
//  LaborLawApp
//
//  Created by Carki on 1/9/26.
//

import SwiftUI

struct CustomLoadingView: View {
    let titleText: String
    let subTitleText: String?
    let isLoading: Bool
    
    private let squareCount = 4
    private let size: CGFloat = 10
    private let spacing: CGFloat = 6
    private let animationDuration: Double = 0.6
    
    @State private var activeIndex: Int = 0
    
    init(titleText: String, subTitleText: String? = nil, isLoading: Bool) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        self.isLoading = isLoading
    }
    
    var body: some View {
        if isLoading {
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
                    
                    HStack(spacing: spacing) {
                        ForEach(0..<squareCount, id: \.self) { index in
                            Rectangle()
                                .fill(CustomColor.customBlack)
                                .frame(width: size, height: size)
                                .scaleEffect(activeIndex == index ? 1.4 : 1.0)
                                .opacity(activeIndex == index ? 1.0 : 0.5)
                                .animation(
                                    .easeInOut(duration: animationDuration),
                                    value: activeIndex
                                )
                        }
                    }
                    .onAppear {
                        startAnimation()
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
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
            activeIndex = (activeIndex + 1) % squareCount
        }
    }
}

#Preview {
    CustomLoadingView(titleText: "텍스트 영역", isLoading: true)
}
