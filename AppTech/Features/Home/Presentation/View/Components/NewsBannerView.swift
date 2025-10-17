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
    @State private var offset: CGFloat = 0
    @State private var textWidth: CGFloat = 0
    @State private var containerWidth: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 8) {
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
                    let width = geo.size.width
                    ZStack(alignment: .leading) {
                        Text(news.title)
                            .fixedSize(horizontal: true, vertical: false)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity, alignment: .center)
                            .background(
                                GeometryReader { textGeo in
                                    Color.clear
                                        .onAppear {
                                            textWidth = textGeo.size.width
                                            containerWidth = width
                                            startMarquee()
                                        }
                                }
                            )
                            .offset(x: offset)
                        
                    }
                    .clipped()
                }
            } else {
                Text("뉴스를 불러오는 중입니다.")
                    .foregroundColor(.white)
            }
        }
        .frame(height: 30)
        .padding(.horizontal, 10)
        .background(Color(.darkGray))
        .cornerRadius(6)
        .onAppear {
            if let random = newsItems.randomElement() {
                selectedNews = random
            }
        }
    }
    
    func startMarquee() {
        // 처음 위치는 오른쪽 바깥
        offset = containerWidth
        // 애니메이션 시작
        withAnimation(.linear(duration: 15.0).repeatForever(autoreverses: false)) {
            offset = -textWidth
        }
    }
}


#Preview {
    NewsBannerView(newsItems: [NewsItem](repeating: .init(title: "Test Marquee News"), count: 5))
}
