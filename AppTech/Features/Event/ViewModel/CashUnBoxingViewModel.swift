//
//  CashUnBoxingViewModel.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/19/25.
//

import Foundation

@MainActor
class CashUnBoxingViewModel: ObservableObject {
    @Published var currentCash: Int = 0
    @Published var remainingCount: Int = 0
    @Published var isLoading = false
    
    private let getUserDataUseCase: GetUserDataUseCase
    
    init(getUserDataUseCase: GetUserDataUseCase) {
        self.getUserDataUseCase = getUserDataUseCase
    }
    
    func loadInitialData() {
        Task {
            isLoading = true
            
            do {
                let user = try await getUserDataUseCase.execute()
                self.currentCash = user.cash
            } catch {
                print("Error \(error)")
            }
            isLoading = false
        }
    }
}
