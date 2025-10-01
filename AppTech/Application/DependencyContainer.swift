//
//  DependencyContainer.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import Foundation

final class DependencyContainer {
    lazy var homeRepository: HomeRepository = MockHomeRepositoryImpl()
    lazy var getHomeDataUseCase: GetHomeDataUseCase = GetHomeDataUseCase(repository: self.homeRepository)
    
    init() { }
    
    @MainActor
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(getHomeDataUseCase: self.getHomeDataUseCase)
    }
}
