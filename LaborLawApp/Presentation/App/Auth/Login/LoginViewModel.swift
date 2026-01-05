//
//  LoginViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/5/26.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var idText: String = ""
    @Published var pwText: String = ""
}
