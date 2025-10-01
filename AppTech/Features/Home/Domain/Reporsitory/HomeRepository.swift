//
//  HomeRepository.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/29/25.
//

import Foundation

protocol HomeRepository {
    func fetchHomeData() async throws -> (UserProfile, Balance, [NewsItem], [FeatureItem])
}
