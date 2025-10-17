//
//  MockHomeRepositoryImpl.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/29/25.
//

import Foundation

class MockHomeRepositoryImpl: HomeRepository {
    func fetchHomeData() async throws -> (UserProfile, Balance,[NewsItem], [FeatureItem]) {
        // api 작업
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        let user = UserProfile(name: "dwahn", ticket: 30)
        let balance = Balance(amount: 100000)
        let newsItem = [
            NewsItem(title: "'손흥민 주장 논란 격파', 홍명보 감독, 손흥민 주장역할 잘 하고 있다[오!쎈현장]"),
            NewsItem(title: "세계 최강 안세영, 세계 배드민턴 연맹 신임 선수 위원 위촉"),
            NewsItem(title: "쿠팡, 인생네컷과 여행 이벤트 협업... 사진찍고 숙박권 받으세요"),
        ]
        let features = [
            FeatureItem(iconName: "gift", title: "이벤트", subtitle: "행운과 함께 \n풍성한 혜택"),
            FeatureItem(iconName: "dollarsign.circle.fill", title: "바로 적립", subtitle: "바로 적립 가능한 \n다양한 광고", isHighlighted: true),
            FeatureItem(iconName: "person.2", title: "친구 초대하기", subtitle: "추천인 C 1,000, T 5  \n친구적립 ~25%"),
            FeatureItem(iconName: "cart", title: "상점", subtitle: "적립 캐시로 상품 교환"),
            FeatureItem(iconName: "gearshape", title: "설정", subtitle: "알람, 내 정보 \n잠금화면 배경 설정"),
            FeatureItem(iconName: "archivebox", title: "보관함", subtitle: "보관함으로 이동")
        ]
        
        return (user, balance, newsItem, features)
    }
}
