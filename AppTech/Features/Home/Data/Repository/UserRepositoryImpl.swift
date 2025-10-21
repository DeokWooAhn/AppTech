//
//  UserRepositoryImpl.swift
//  AppTech
//
//  Created by AhnDeokWoo on 10/21/25.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    func fetchUserData() async throws -> UserItem {
        
        // api 작업
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        let user = UserItem(name: "dwahn", cash: 10000, ticket: 30)
        
        return user
    }
}
