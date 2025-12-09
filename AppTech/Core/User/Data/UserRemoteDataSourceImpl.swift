//
//  UserLocalDataSource.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/27/25.
//

import Foundation

class UserRemoteDataSourceImpl: UserRemoteDataSource {
    func fetchUser() async throws -> UserDTO {
        try await Task.sleep(nanoseconds: 100_000_000)
        return UserDTO(name: "dwahn", cash: 77777, ticket: 100, welcomeMode: false)
    }
}
