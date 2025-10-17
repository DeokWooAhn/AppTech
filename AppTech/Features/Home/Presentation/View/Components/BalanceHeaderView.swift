//
//  BalanceHeaderView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

struct BalanceHeaderView: View {
    let balanceText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("캐시스크린")
                .font(.title3)
                .foregroundColor(.black)
            
            Text(balanceText)
                .font(.system(size: 36))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.yellow))
    }
}

#Preview {
    BalanceHeaderView(balanceText: "C 100000")
}
