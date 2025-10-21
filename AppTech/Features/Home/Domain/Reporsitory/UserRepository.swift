//
//  UserRepository.swift
//  AppTech
//
//  Created by AhnDeokWoo on 10/21/25.
//

import Foundation

protocol UserRepository {
    func fetchUserData() async throws -> UserItem
}
