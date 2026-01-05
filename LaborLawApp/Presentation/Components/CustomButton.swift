//
//  CustomButton.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

struct CustomButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isDisabled: Bool = false
    
    var text: String
    var type: CustomButton.ButtonType
    var onClick: () -> ()
    
    init(type: CustomButton.ButtonType = .middle, text: String, onClick: @escaping () -> Void) {
        self.text = text
        self.type = type
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(text)
                .font(Font.buttonText)
                .foregroundColor(CustomColor.customGray100)
                .frame(maxWidth: type.horizontal == 0 ? .infinity : nil)
                .padding(.vertical, type.vertical)
                .padding(.horizontal, type.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(isEnabled ? CustomColor.customBlack : CustomColor.customGray400)
                )
        })
    }
}

extension CustomButton {
    enum ButtonType {
        case xsmall
        case small
        case middle
        case large
        case textField
        
        var vertical: CGFloat {
            switch self {
            case .xsmall:
                return 9
            case .small:
                return 14
            case .middle:
                return 14
            case .large:
                return 21
            case .textField:
                return 9
            }
        }
        
        var horizontal: CGFloat {
            switch self {
            case .xsmall:
                return 42
            case .small:
                return 127
            case .middle:
                return 0
            case .large:
                return  0
            case .textField:
                return 12
            }
        }
    }
}
