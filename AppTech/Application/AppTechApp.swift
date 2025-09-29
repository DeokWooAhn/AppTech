//
//  AppTechApp.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

@main
struct AppTechApp: App {
    private let homeViewModel: HomeViewModel
    
    init() {
        let homeRepository = MockHomeRepositoryImpl()
        
        let getHomeDataUseCase = GetHomeDataUseCase(repository: homeRepository)
        
        self.homeViewModel = HomeViewModel(getHomeDataUseCase: getHomeDataUseCase)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
        }
    }
}
