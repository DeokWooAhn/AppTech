//
//  HomeViewModel.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var userProfile: UserProfile?
    @Published var balance: Balance?
    @Published var newsItems: [NewsItem] = []
    @Published var featureItems: [FeatureItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let getHomeDataUseCase: GetHomeDataUseCase
    
    init(getHomeDataUseCase: GetHomeDataUseCase) {
        self.getHomeDataUseCase = getHomeDataUseCase
    }
    
    func loadHomeData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let (user, balance, news, features) = try await getHomeDataUseCase.execute()
                self.userProfile = user
                self.balance = balance
                self.newsItems = news
                self.featureItems = features
            } catch {
                self.errorMessage = "데이터를 불러오는데 실패했습니다 : \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
    var formattedBalance: String {
        guard let amount = balance?.amount else { return "C 0"}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return "C \(numberFormatter.string(from: NSNumber(value: amount)) ?? "0")"
    }
}
