//
//  NewsBannerView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import SwiftUI

struct NewsBannerView: View {
    let newsItems: [NewsItem]
    @State private var selectedNews: NewsItem?
    @State private var animate: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            RoundedRectangle(cornerRadius: 6)
                .fill(.gray)
                .frame(width: 40, height: 25)
                .overlay(
                    Text("뉴스")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                )
            
            if let news = selectedNews {
                GeometryReader { geo in
                    Text(news.title)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .offset(x: animate ? -geo.size.width : geo.size.width)
                        .position(y: 14)
                        .fixedSize(horizontal: true, vertical: false)
                        .animation(
                            Animation.linear(duration: 15.0)
                                .repeatForever(autoreverses: false),
                            value: animate
                        )
                        .onAppear {
                            animate = true
                        }
                }
                .clipped()
            } else {
                Text("Loading News...")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 10)
        .background(Color(.darkGray))
        .cornerRadius(6)
        .onAppear {
            // 초기 랜덤 뉴스 선택
            if let random = newsItems.randomElement() {
                selectedNews = random
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    NewsBannerView(newsItems: [NewsItem](repeating: .init(title: "Test Marquee News"), count: 5))
}
