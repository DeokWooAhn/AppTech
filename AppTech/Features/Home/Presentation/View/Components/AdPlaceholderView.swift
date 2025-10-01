//
//  AdPlaceholderView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import SwiftUI

struct AdPlaceholderView: View {
    var body: some View {
        // 광고 SDK 처리
        
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .overlay(
                Text("광고 영역")
                    .foregroundColor(.gray)
                    .font(.caption)
            )
    }
}

#Preview {
    AdPlaceholderView()
}
