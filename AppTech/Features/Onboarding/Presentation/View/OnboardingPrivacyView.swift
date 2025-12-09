//
//  OnboardingPrivacyView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import SwiftUI

struct OnboardingPrivacyView: View {
    var onAgree: () -> Void
    
    let items: [OnboardingItem] = [
        OnboardingItem(
            iconName: "person.text.rectangle",
            title: "사용자 ID",
            description: "캐시스크린 앱 로그인을 위해 사용자 ID 수집/\n전송이 필요해요",
        ),
        OnboardingItem(
            iconName: "figure.dance.circle",
            title: "광고 ID",
            description: "캐시스크린 앱 광고 제공을 위해 광고 ID\n수집/전송이 필요해요",
        ),
        OnboardingItem(
            iconName: "smartphone",
            title: "기기 ID",
            description: "캐시스크린 앱 광고 적립을 위해 기기 ID\n수집/전송이 필요해요",
        ),
        OnboardingItem(
            iconName: "at",
            title: "이메일 주소",
            description: "캐시스크린 앱 상품 교환을 위해 이메일 주소\n수집/전송이 필요해요",
        ),
        OnboardingItem(
            iconName: "phone.book.closed",
            title: "전화번호",
            description: "캐시스크린 앱 상품 교환을 위해 전화번호\n수집/전송이 필요해요",
        ),
        OnboardingItem(
            iconName: "person.badge.shield.checkmark.fill",
            title: "이름",
            description: "캐시스크린 앱 상품 교환을 위해 이름 수집/\n전송이 필요해요",
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("개인정보 처리 동의 안내")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.black.opacity(0.85))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(items) { item in
                        OnboardingRowView(item: item)
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 24)
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 0) {
                Button(action: {
                    
                }) {
                    Text("동의 안함")
                        .font(Font.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.85))
                }
                
                Button(action: {
                    onAgree()
                }) {
                    Text("동의함")
                        .font(Font.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.yellow)
                }
            }
            .frame(height: 50)
        }
        .background(.white)
    }
    
    struct OnboardingRowView: View {
        let item: OnboardingItem
        
        var body: some View {
            HStack(alignment: .top, spacing: 16) {
                Group {
                    Image(systemName: item.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black.opacity(0.8))
                        .frame(width: 30)
                }
                .padding(.top, 2)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text(item.description)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}
