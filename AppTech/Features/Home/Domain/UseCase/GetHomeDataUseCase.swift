//
//  GetHomeDataUseCase.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/29/25.
//

import Foundation

class GetHomeDataUseCase {
    private let respository: HomeRepository
    
    init(repository: HomeRepository) {
        self.respository = repository
    }
    
    func execute() async throws -> (UserProfile, Balance, [FeatureItem]) {
        try await respository.fetchHomeData()
    }
    
}
