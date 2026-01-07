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
}
