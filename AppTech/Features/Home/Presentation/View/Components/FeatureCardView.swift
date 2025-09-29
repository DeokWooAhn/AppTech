//
//  FeatureCardView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

struct FeatureCardView: View {
    let item: FeatureItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: item.iconName)
                .font(.title2)
                .foregroundColor(item.isHighlighted ? .white : .accentColor)
            
            Text(item.title)
                .font(.headline)
                .foregroundColor(item.isHighlighted ? .white: .primary)
            
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(item.isHighlighted ? .white.opacity(0.8) : .secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
        .padding()
        .background(item.isHighlighted ? Color.blue : Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    VStack(spacing: 16) {
        // 1. 기본 카드 프리뷰
        FeatureCardView(item: FeatureItem(
            iconName: "gift.fill",
            title: "이벤트",
            subtitle: "행운과 함께, 풍성한 혜택"
        ))
        
        // 2. 강조된 카드 프리뷰
        FeatureCardView(item: FeatureItem(
            iconName: "dollarsign.circle.fill",
            title: "바로 적립",
            subtitle: "바로 적립 가능한, 다양한 광고",
            isHighlighted: true
        ))
    }
    .padding()
}
