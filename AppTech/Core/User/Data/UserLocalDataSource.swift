//
//  UserLocalDataSource.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/27/25.
//

import Foundation

protocol UserLocalDataSource {
    func getCash() -> Int
    func saveCash(_ cash: Int)
    
    func getCashUnBoxingCount() -> Int
    func saveCashUnBoxingCount(_ count: Int)
    
    func getLastFetchTime() -> Date?
    func saveLastFetchTime(_ date: Date)
}
