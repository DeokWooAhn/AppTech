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
                let (user, news, features) = try await getHomeDataUseCase.execute()
                self.userItem = user
                self.newsItems = news
                self.featureItems = features
            } catch {
                self.errorMessage = "데이터를 불러오는데 실패했습니다 : \(error.localizedDescription)"
            }
            isLoading = false
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
