//
//  TopBarView.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct TopBarView: View {
    enum IconType {
        case close
        case back
        case none
        
        var image: String? {
            switch self {
            case .close:
                return "xmark"
            case .back:
                return "arrow.backward"
            case .none:
                return nil
            }
        }
    }
    
    var type: IconType
    var text: String
    var onTap: ()->()
    
    // 오른쪽 옵션
    var rightIconName: String? = nil
    var onRightTap: (() -> Void)? = nil
    
    var rightText: String? = nil
    var onRightTextTap: (() -> Void)? = nil
    
    init(type: IconType = .none,
         text: String,
         onTap: @escaping () -> Void,
         rightIconName: String? = nil,
         onRightTap: (() -> Void)? = nil,
         rightText: String? = nil,
         onRightTextTap: (() -> Void)? = nil) {
        self.type = type
        self.text = text
        self.onTap = onTap
        self.rightIconName = rightIconName
        self.onRightTap = onRightTap
        self.rightText = rightText
        self.onRightTextTap = onRightTextTap
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                // 왼쪽 아이콘
                if let systemName = type.image {
                    HStack {
                        Image(systemName: systemName)
                            .font(.system(size: 16))
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                onTap()
                            }
                        Spacer()
                    }
                }
                
                // 중앙 텍스트
                Text(text)
                    .font(Font.topbarViewText)
                    .foregroundStyle(CustomColor.customBlack)
                
                // 오른쪽 끝 버튼
                HStack {
                    Spacer()
                    
                    if let rightText = rightText, let onRightTextTap = onRightTextTap {
                        Button(rightText, action: onRightTextTap)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.horizontal)
                    } else if let rightIconName = rightIconName, let onRightTap = onRightTap {
                        Image(systemName: rightIconName)
                            .font(.system(size: 16))
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture { onRightTap() }
                    }
                }
            }
            .frame(height: 55)
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundStyle(CustomColor.topbarLineColor)
        }
        .frame(height: 56, alignment: .top)
        .background(CustomColor.customWhite)
    }
}

#Preview {
    TopBarView(text: "adsf") {
        
    }
}
