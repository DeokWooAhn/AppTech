//
//  UserRepositoryImpl.swift
//  AppTech
//
//  Created by AhnDeokWoo on 10/21/25.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let remoteDataSource: UserRemoteDataSource
    private let localDataSource: UserLocalDataSource
    
    private let cachedValidTiem: TimeInterval = 10 * 60
    
    init(remoteDataSource: UserRemoteDataSource, localDataSource: UserLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchUserData() async throws -> UserItem {
        let lastFetchTime = localDataSource.getLastFetchTime()
        let now = Date()
        
        let apiCall = lastFetchTime == nil || now.timeIntervalSince(lastFetchTime!) > cachedValidTiem
        
        if apiCall {
            let userData = try await remoteDataSource.fetchUser()
            localDataSource.saveCash(userData.cash)
            localDataSource.saveLastFetchTime(Date())
            
            return UserItem(
                name: userData.name,
                cash: userData.cash,
                ticket: userData.ticket,
                boxCount: localDataSource.getCashUnBoxingCount(),
                welcomeMode: userData.welcomeMode
            )
        } else {
            let cachedCash = localDataSource.getCash()
            let boxCount = localDataSource.getCashUnBoxingCount()
            
            return UserItem(
                name: "dwahn",
                cash: cachedCash,
                ticket: 100,
                boxCount: boxCount,
                welcomeMode: false
            )
        }
    }
    
    func updateUserStatus(cash: Int, count: Int) {
        localDataSource.saveCash(cash)
        localDataSource.saveCashUnBoxingCount(count)
        
        // 서버로 업데이트 된 값 보내주기
    }
}
