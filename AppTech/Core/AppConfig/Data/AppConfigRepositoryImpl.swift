//
//  AppConfigRepositoryImpl.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import Foundation

class AppConfigRepositoryImpl: AppConfigRepository {
    private let userDefaults = UserDefaults.standard
    private let userPrivacyKey = "user_privacy_agreed"
    
    func isPrivacyAgreed() -> Bool {
        return userDefaults.bool(forKey: userPrivacyKey)
    }
    
    func setPrivacyAgreed(_ value: Bool) {
        userDefaults.set(value, forKey: userPrivacyKey)
    }
}
