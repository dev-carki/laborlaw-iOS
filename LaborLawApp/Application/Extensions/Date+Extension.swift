//
//  Date+Extension.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import Foundation

extension Date {

    // MARK: 한국 시간 기준 "yyyy년 M월 d일" 문자열로 변환
    func toKoreanDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.dateFormat = "yyyy년 M월 d일"

        return formatter.string(from: self)
    }
}
