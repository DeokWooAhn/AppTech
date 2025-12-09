//
//  AppTechApp.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

enum AppScreenState {
    case splash
    case onboarding
    case home
}

@main
struct AppTechApp: App {
    let container = DependencyContainer()
    @State private var screenState: AppScreenState = .splash
    
    var body: some Scene {
        WindowGroup {
            switch screenState {
            case .splash:
                SplashView()
                    .onAppear {
                        checkAppStatus()
                    }
                
            case .onboarding:
                OnboardingPrivacyView(onAgree: {
                    container.appConfigRepository.setPrivacyAgreed(true)
                    
                    withAnimation {
                        screenState = .home
                    }
                })
                
            case .home:
                HomeView(
                    viewModel: container.makeHomeViewModel(),
                    cashUnBoxingViewFactory: {
                        return CashUnBoxingView(viewModel: container.makeCashUnBoxingViewModel())
                    }
                )
            }
        }
    }
    
    private func checkAppStatus() {
            Task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                
                let hasAgreed = container.appConfigRepository.isPrivacyAgreed()
                
                withAnimation {
                    if hasAgreed {
                        screenState = .home
                    } else {
                        screenState = .onboarding
                    }
                }
            }
        }
}
