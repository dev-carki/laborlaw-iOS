//
//  Color+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import SwiftUI

class CustomColor {
    static let customBlack: Color = Color(hex: "#1A1A1A")
    static let customWhite: Color = Color(hex: "#FFFFFF")
    static let customDarkgray: Color = Color(hex: "#404040")
    
    static let fail: Color = Color(hex: "#FF0000")
    static let success: Color = Color(hex: "#27AA74")
    
    static let topbarLineColor: Color = Color(hex: "#F4F5F7")
    
    static let customGray700: Color = Color(hex: "#5C5C5C")
    static let customGray600: Color = Color(hex: "#757575")
    static let customGray500: Color = Color(hex: "#8F8F8F")
    static let customGray400: Color = Color(hex: "#A8A8A8")
    static let customGray300: Color = Color(hex: "#C2C2C2")
    static let customGray200: Color = Color(hex: "#DBDBDB")
    static let customGray100: Color = Color(hex: "#F5F5F5")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
