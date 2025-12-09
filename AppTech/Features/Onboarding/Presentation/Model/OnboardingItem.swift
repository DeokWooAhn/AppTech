//
//  OnboardingItem.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let description: String
}
