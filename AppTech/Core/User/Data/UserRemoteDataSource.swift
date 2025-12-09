//
//  UserLocalDataSource.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/27/25.
//

import Foundation

protocol UserRemoteDataSource {
    func fetchUser() async throws -> UserDTO
}
