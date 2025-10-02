//
//  NewsBannerView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import SwiftUI

struct NewsBannerView: View {
    let newsItems: [NewsItem]
    @State private var currentIndex: Int = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "newspaper.fill")
                .foregroundColor(.gray)
                .font(.caption)
            
            Group {
                if !newsItems.isEmpty {
                    Text(newsItems[currentIndex].title)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                } else {
                    Text("No News")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .transition(.opacity.animation(.easeInOut(duration: 0.5)))
            .id(currentIndex)
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(8)
        .onReceive(timer) { _ in
            if !newsItems.isEmpty {
                withAnimation {
                    currentIndex = (currentIndex + 1) % newsItems.count
                }
            }
        }
    }
}

#Preview {
    NewsBannerView(newsItems: [NewsItem](repeating: .init(title: "Test"), count: 5))
}
