//
//  FeatureItem.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/29/25.
//

import Foundation

struct FeatureItem: Identifiable {
    let id: UUID
    let iconName: String
    let title: String
    let subtitle: String
    let isHighlighted: Bool
    
    init(id: UUID = UUID(), iconName: String, title: String, subtitle: String, isHighlighted: Bool = false) {
        self.id = id
        self.iconName = iconName
        self.title = title
        self.subtitle = subtitle
        self.isHighlighted = isHighlighted
    }
}
