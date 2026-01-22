//
//  Font+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI
import UIKit

enum CustomFont: String {
    case bold = "Pretendard-Bold"
    case regular = "pretendard-regular"
    case semiBold = "pretendard-semibold"
    case medium = "pretendard-medium"
}

extension Font {
    //MARK: App
    static let titleText: Font = .custom(CustomFont.semiBold.rawValue, size: 20)
    static let subTitleText: Font = .custom(CustomFont.regular.rawValue, size: 14)
    static let buttonText: Font = .custom(CustomFont.semiBold.rawValue, size: 16)
    static let placeholderText: Font = .custom(CustomFont.medium.rawValue, size: 14)
    static let inputTitle: Font = .custom(CustomFont.bold.rawValue, size: 16)
    static let inputText: Font = .custom(CustomFont.regular.rawValue, size: 16)
    static let chatText: Font = .custom(CustomFont.regular.rawValue, size: 14)
    static let regularText: Font = .custom(CustomFont.regular.rawValue, size: 12)
    static let radioButtonText: Font = .custom(CustomFont.semiBold.rawValue, size: 14)
    static let topbarViewText: Font = .custom(CustomFont.bold.rawValue, size: 16)
    static let loadingViewTitleText: Font = .custom(CustomFont.medium.rawValue, size: 22)
    static let loadingViewSubTitleText: Font = .custom(CustomFont.medium.rawValue, size: 16)
    static let chatBoxTitleText: Font = .custom(CustomFont.semiBold.rawValue, size: 18)
    static let chatBoxDateText: Font = .custom(CustomFont.regular.rawValue, size: 14)
    static let categoryTextBadge: Font = .custom(CustomFont.medium.rawValue, size: 10)
    static let postListNickNameText: Font = .custom(CustomFont.medium.rawValue, size: 18)
    static let postListTitleText: Font = .custom(CustomFont.regular.rawValue, size: 14)
}

extension UIFont {
    static let inputText: UIFont = UIFont(name: CustomFont.regular.rawValue, size: 16)!
    static let placeholderText: UIFont = UIFont(name: CustomFont.medium.rawValue, size: 14)!
}
