//
//  HomeView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("데이터 로딩중...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    mainContentView
                }
            }
            .navigationTitle("캐시스크린")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        HStack {
                            Text(viewModel.userProfile?.name ?? "")
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                        }
                    }
                }
            }
            .onAppear {
                if viewModel.featureItems.isEmpty {
                    viewModel.loadHomeData()
                }
            }
        }
    }
    
    private var mainContentView: some View {
        ScrollView {
            VStack(spacing: 24) {
                BalanceHeaderView(balanceText: viewModel.formattedBalance)
                    .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.featureItems) { item in
                        FeatureCardView(item: item)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = MockHomeRepositoryImpl()
        let useCase = GetHomeDataUseCase(repository: repository)
        let viewModel = HomeViewModel(getHomeDataUseCase: useCase)
        
        HomeView(viewModel: viewModel)
    }
}
