//
//  HomeView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    @State private var isShowingCashUnBoxing = false
    @State private var navigateToEventView = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        ZStack {
            NavigationStack {
                Group {
                    if viewModel.isLoading {
                        ProgressView("데이터 로딩중...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    } else {
                        mainContentView
                    }
                }
                .onAppear {
                    if viewModel.userItem == nil {
                        viewModel.loadHomeData()
                    }
                }
    //            .navigationTitle("캐시스크린")
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarTrailing) {
    //                    Button(action: {
    //
    //                    }) {
    //                        HStack {
    //                            Text(viewModel.userProfile?.name ?? "")
    //                            Image(systemName: "person.circle.fill")
    //                                .font(.title2)
    //                        }
    //                    }
    //                }
    //            }
                .navigationDestination(isPresented: $navigateToEventView) {
                    EventView()
                }
            }
            
            if isShowingCashUnBoxing {
                CashUnBoxingDialog(isPresented: $isShowingCashUnBoxing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity.animation(.easeInOut))
                    .zIndex(1)
            }
        }
        .onChange(of: isShowingCashUnBoxing) { oldValue, newValue in
            if oldValue == true && newValue == false {
                navigateToEventView = true
            }
        }
    }
    
    private var mainContentView: some View {
        ScrollView {
            VStack(spacing: 8) {
                HeaderView(
                    userName: viewModel.userItem?.name ?? "error",
                    userCash: viewModel.formattedCash,
                    userTicket: viewModel.formattedTicket
                )
                
                if !viewModel.newsItems.isEmpty {
                    NewsBannerView(newsItems: viewModel.newsItems)
                        .frame(height: 35)
                        .padding(.horizontal)
                }
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.featureItem) { item in
                        FeatureCardView(item: item)
                    }
                }
                .padding(.horizontal)
                
                AdPlaceholderView()
                    .frame(width: 300, height: 250)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
    }
}
