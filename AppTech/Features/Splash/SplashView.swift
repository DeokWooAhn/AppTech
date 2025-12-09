//
//  SwiftUIView.swift
//  AppTech
//
//  Created by AhnDeokWoo on 12/7/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            Image("LaunchImage")
        }
    }
}

#Preview {
    SplashView()
}
