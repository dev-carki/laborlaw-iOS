//
//  RegexHelper.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

final class RegexHelper {
    // 이메일 형식
    func isEmailFormat(text: String) -> Bool {
        let pattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"
        return getMatches(pattern, text: text)
    }
    
    // 계정 비밀번호 형식
    func isPasswordFormat(text: String) -> Bool {
        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).+$"
        return getMatches(pattern, text: text)
    }
    
    func getMatches(_ pattern: String, text: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            
            let range = NSRange(location: 0, length: text.utf16.count)
            let matches = regex.matches(in: text, options: [], range: range)
            
            if matches.count > 0 {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
