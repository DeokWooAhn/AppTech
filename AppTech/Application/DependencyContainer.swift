//
//  DependencyContainer.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/30/25.
//

import Foundation

final class DependencyContainer {
    lazy var appConfigRepository: AppConfigRepository = AppConfigRepositoryImpl()
    
    lazy var homeRepository: HomeRepository = HomeRepositoryImpl()
    lazy var getNewsDataUseCase: GetNewsDataUseCase = GetNewsDataUseCase(repository: self.homeRepository)
    
    lazy var userRemoteDataSource: UserRemoteDataSource = UserRemoteDataSourceImpl()
    lazy var userLocalDataSource: UserLocalDataSource = UserLocalDataSourceImpl()
    
    lazy var userRepository: UserRepository = UserRepositoryImpl(
        remoteDataSource: self.userRemoteDataSource,
        localDataSource: self.userLocalDataSource
    )
    
    lazy var getUserDataUseCase = GetUserDataUseCase(repository: self.userRepository)
    lazy var cashUnBoxingUseCase = CashUnBoxingUseCase(repository: self.userRepository)
    
    init() { }
    
    @MainActor
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(
            getUserDataUseCase: self.getUserDataUseCase,
            getNewsDataUseCase: self.getNewsDataUseCase
        )
    }
    
    @MainActor
    func makeCashUnBoxingViewModel() -> CashUnBoxingViewModel {
        return CashUnBoxingViewModel(
            getUserDataUseCase: self.getUserDataUseCase,
            decreaseBoxCountUseCase: self.cashUnBoxingUseCase
        )
    }
}
