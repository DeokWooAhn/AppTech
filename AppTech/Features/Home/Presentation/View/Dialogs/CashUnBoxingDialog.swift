//
//  CashUnBoxingView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 11/5/25.
//

import SwiftUI

struct CashUnBoxingDialog: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text("캐시오픈업 참여 방법")
                    .font(.title2.bold())
                
                Text("무료 참여! 지금 버튼을 눌러 캐시 적립 받으세요")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                AdPlaceholderView()
                    .frame(width: 300, height: 250)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                Button("확인") {
                    isPresented = false
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
            }
            .padding(20)
            .background(Color(.systemBackground))
            .cornerRadius(14)
            .shadow(radius: 10)
            .padding(30)
        }
    }
}

#Preview {
}
