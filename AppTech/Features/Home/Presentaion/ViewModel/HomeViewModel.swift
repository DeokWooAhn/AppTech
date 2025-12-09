//
//  HomeViewModel.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var userItem: UserItem?
    @Published var newsItems: [NewsItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let getUserDataUseCase: GetUserDataUseCase
    private let getNewsDataUseCase: GetNewsDataUseCase
    
    init(
        getUserDataUseCase: GetUserDataUseCase,
        getNewsDataUseCase: GetNewsDataUseCase
    ) {
        self.getUserDataUseCase = getUserDataUseCase
        self.getNewsDataUseCase = getNewsDataUseCase
    }
    
    func loadHomeData() {
        if userItem == nil {
            isLoading = true
        }
    
        errorMessage = nil
        
        Task {
            do {
                async let user = getUserDataUseCase.execute()
                async let news = getNewsDataUseCase.execute()
                
                self.userItem = try await user
                self.newsItems = try await news
            } catch {
                self.errorMessage = "데이터를 불러오는데 실패했습니다 : \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
    
    var featureItem: [FeatureItem] {
        let allFeatures = [
            FeatureItem(iconName: "gift", title: "이벤트", subtitle: "행운과 함께 \n풍성한 혜택"),
            FeatureItem(iconName: "dollarsign.circle.fill", title: "바로 적립", subtitle: "바로 적립 가능한 \n다양한 광고", isHighlighted: true),
            FeatureItem(iconName: "person.2", title: "친구 초대하기", subtitle: "추천인 C 1,000, T 5  \n친구적립 ~25%"),
            FeatureItem(iconName: "cart", title: "상점", subtitle: "적립 캐시로 상품 교환"),
            FeatureItem(iconName: "gearshape", title: "설정", subtitle: "알람, 내 정보 \n잠금화면 배경 설정"),
            FeatureItem(iconName: "archivebox", title: "보관함", subtitle: "보관함으로 이동")
        ]
        
        if userItem?.welcomeMode == true {
            return Array(allFeatures.prefix(4))
        } else {
            return allFeatures
        }
    }
    
    var formattedCash: String {
        guard let cash = userItem?.cash else { return "C 0"}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return "C \(numberFormatter.string(from: NSNumber(value: cash)) ?? "0")"
    }
    
    var formattedTicket: String {
        guard let ticket = userItem?.ticket else { return "0"}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return "\(numberFormatter.string(from: NSNumber(value: ticket)) ?? "0")"
    }
}
