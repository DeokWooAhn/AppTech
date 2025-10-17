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
            Text("내 캐시")
                .font(.callout)
                .foregroundColor(.secondary)
            
            Text(balanceText)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.yellow))
        .cornerRadius(12)
    }
}

#Preview {
    BalanceHeaderView(balanceText: "C 100000")
}
