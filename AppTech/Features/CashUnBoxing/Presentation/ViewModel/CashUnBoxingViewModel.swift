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
    @Published var cashUnBoxingCount: Int = 0
    @Published var isLoading = false
    
    private let getUserDataUseCase: GetUserDataUseCase
    private let cashUnBoxingUseCase: CashUnBoxingUseCase
    
    init(
        getUserDataUseCase: GetUserDataUseCase,
        decreaseBoxCountUseCase: CashUnBoxingUseCase
    ) {
        self.getUserDataUseCase = getUserDataUseCase
        self.cashUnBoxingUseCase = decreaseBoxCountUseCase
    }
    
    func loadInitialData() {
        Task {
            isLoading = true
            
            do {
                let user = try await getUserDataUseCase.execute()
                self.currentCash = user.cash
                self.cashUnBoxingCount = user.boxCount
            } catch {
                print("Error \(error)")
            }
            isLoading = false
        }
    }
    
    func openBox() {
        guard cashUnBoxingCount > 0 else { return }
        
        currentCash += 1
        cashUnBoxingCount -= 1
        
        cashUnBoxingUseCase.execute(currentCash: currentCash, currentCount: cashUnBoxingCount)
    }
}
