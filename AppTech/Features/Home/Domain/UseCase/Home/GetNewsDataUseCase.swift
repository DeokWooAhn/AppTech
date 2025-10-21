//
//  GetNewsDataUseCase.swift
//  AppTech
//
//  Created by AhnDeokWoo on 10/21/25.
//

import Foundation

class GetNewsDataUseCase {
    private let respository: HomeRepository
    
    init(repository: HomeRepository) {
        self.respository = repository
    }
    
    func execute() async throws -> [NewsItem] {
        try await respository.fetchNewsData()
    }
}
