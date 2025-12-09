//
//  DecreaseBoxCountUseCase.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import Foundation

class CashUnBoxingUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(currentCash: Int, currentCount: Int) {
        repository.updateUserStatus(cash: currentCash, count: currentCount)
    }
}
