//
//  DependencyContainer.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import Foundation

final class DependencyContainer {
    lazy var homeRepository: HomeRepository = HomeRepositoryImpl()
    lazy var getNewsDataUseCase: GetNewsDataUseCase = GetNewsDataUseCase(repository: self.homeRepository)
    
    lazy var userRepository: UserRepository = UserRepositoryImpl()
    lazy var getUserDataUseCase: GetUserDataUseCase = GetUserDataUseCase(repository: self.userRepository)
    
    init() { }
    
    @MainActor
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(
            getUserDataUseCase: self.getUserDataUseCase,
            getNewsDataUseCase: self.getNewsDataUseCase
        )
    }
}
