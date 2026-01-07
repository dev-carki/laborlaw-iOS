//
//  Font+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

enum CustomFont: String {
    case bold = "Pretendard-Bold"
    case regular = "pretendard-regular"
    case semiBold = "pretendard-semibold"
    case medium = "pretendard-medium"
}

extension Font {
    //MARK: App
    static let buttonText: Font = .custom(CustomFont.semiBold.rawValue, size: 16)
    static let placeholderText: Font = .custom(CustomFont.medium.rawValue, size: 14)
    static let inputText: Font = .custom(CustomFont.regular.rawValue, size: 16)
    static let regularText: Font = .custom(CustomFont.regular.rawValue, size: 12)
    static let radioButtonText: Font = .custom(CustomFont.semiBold.rawValue, size: 14)
    static let topbarViewText: Font = .custom(CustomFont.bold.rawValue, size: 16)
    // static let headline: Font = .custom(TRKFont.bold.rawValue, size: 24)
    //Pretendard.semi_bold.value, size: 16
}
