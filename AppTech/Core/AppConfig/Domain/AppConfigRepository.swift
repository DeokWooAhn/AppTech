//
//  AppConfigRepository.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import Foundation

protocol AppConfigRepository {
    func isPrivacyAgreed() -> Bool
    func setPrivacyAgreed(_ value: Bool)
}
