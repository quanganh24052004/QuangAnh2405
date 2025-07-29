//
//  Root.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct Root: View {
    @State private var selectedTab: Tab = .report
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .report:
                    Report()
                case .settings:
                    Settings()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background1.ignoresSafeArea(.all, edges: .all))
        .navigationBarBackButtonHidden(true)
        .overlay(alignment: .bottom) {
            TabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.all, edges: .bottom)

    }
}

#Preview {
    Root()
}
