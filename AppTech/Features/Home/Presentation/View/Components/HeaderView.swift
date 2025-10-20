//
//  BalanceHeaderView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 9/28/25.
//

import SwiftUI

struct HeaderView: View {
    let userName: String
    let userCash: String
    let userTicket: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("캐시스크린")
                    .font(.title3)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("\(userName) 님")
            }
            
            HStack {
                Text(userCash)
                    .font(.system(size: 36))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(userTicket)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.yellow))
    }
}

#Preview {
    HeaderView(
        userName: "ddd",
        userCash: "C 100000",
        userTicket: "100"
    )
}
