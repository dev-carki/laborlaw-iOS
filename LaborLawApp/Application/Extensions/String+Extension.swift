//
//  String+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import Foundation

extension String {
    func textFieldTextlimited(to maxLength: Int) -> String {
        String(prefix(maxLength))
    }
    
    func toKoreanDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        guard let date = formatter.date(from: self) else {
            return self
        }
        
        let output = DateFormatter()
        output.locale = Locale(identifier: "ko_KR")
        output.dateFormat = "yyyy년 M월 d일"
        
        return output.string(from: date)
    }
}
