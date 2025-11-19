//
//  EventView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/5/25.
//

import SwiftUI

struct CashUnBoxingView: View {
    
    let backgroundColor = Color(red: 44/255, green: 47/255, blue: 54/255)
    let cardColor = Color(red: 60/255, green: 63/255, blue: 70/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                
                VStack(spacing: 80) {
                    HStack {
                        Text("보유 캐시")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            ZStack {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 20, height: 20)
                                Text("C")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Text("7,000")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .background(cardColor)
                    .cornerRadius(12)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 100) {
                        Text("상자를 눌러주세요")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        VStack(spacing: 10) {
                            Button(action: {
                                print("Box tapped")
                            }) {
                                
                                Image(systemName: "gift.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.red)
                                    .overlay(
                                        Image(systemName: "gift")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.white)
                                    )
                            }
                            
                            Text("잔여 횟수 30")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                        }
                        
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
            
            .navigationTitle("캐시 오픈업")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(backgroundColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct CashOpenUpView_Previews: PreviewProvider {
    static var previews: some View {
        CashUnBoxingView()
    }
}
