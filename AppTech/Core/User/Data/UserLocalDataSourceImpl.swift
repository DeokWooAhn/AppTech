//
//  UserLocalDataSource.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/27/25.
//

import Foundation

class UserLocalDataSourceImpl: UserLocalDataSource {
    private let userDefaults = UserDefaults.standard
    private let countKey = "box_count"
    private let cashKey = "cash"
    private let timeKey = "last_api_fetch_time"
    
    func getCash() -> Int {
        return userDefaults.integer(forKey: cashKey)
    }
    
    func saveCash(_ cash: Int) {
        userDefaults.set(cash, forKey: cashKey)
    }
    
    func getCashUnBoxingCount() -> Int {
        if userDefaults.object(forKey: countKey) == nil {
            return 30
        }
        
        return userDefaults.integer(forKey: countKey)
    }
    
    func saveCashUnBoxingCount(_ count: Int) {
        userDefaults.set(count, forKey: countKey)
    }
    
    func getLastFetchTime() -> Date? {
        return userDefaults.object(forKey: timeKey) as? Date
    }
    
    func saveLastFetchTime(_ date: Date) {
        userDefaults.set(date, forKey: timeKey)
    }
}
