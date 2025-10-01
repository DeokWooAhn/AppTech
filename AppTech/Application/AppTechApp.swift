//
//  AppTechApp.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

@main
struct AppTechApp: App {
    let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: container.makeHomeViewModel())
        }
    }
}
