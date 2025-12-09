//
//  GetHomeDataUseCase.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/29/25.
//

import Foundation

class GetUserDataUseCase {
    private let respository: UserRepository
    
    init(repository: UserRepository) {
        self.respository = repository
    }
    
    func execute() async throws -> UserItem {
        return try await respository.fetchUserData()
    }
}
