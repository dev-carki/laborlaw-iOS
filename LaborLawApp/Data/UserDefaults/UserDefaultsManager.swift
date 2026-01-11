//
//  UserDefaultsManager.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

class UserDefaultsManager {
    @UserDefault<String>(key: UserDefaultsKeys.accessToken.rawValue, defaultValue: "")
    var accessToken
}

@propertyWrapper struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    
    var wrappedValue: T {
        get { (UserDefaults.standard.object(forKey: self.key) as? T) ?? self.defaultValue }
        set { UserDefaults.standard.setValue(newValue, forKey: key) }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
