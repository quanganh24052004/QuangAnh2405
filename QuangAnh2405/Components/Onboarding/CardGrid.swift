//
//  CardGrid.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct CardGrid: View {
    let data: [CardData]
    let currentStep: NavigationManager.OnboardingStep
    @EnvironmentObject var navigationManager: NavigationManager

    let columns = [
        GridItem(.flexible(),spacing: 16),
        GridItem(.flexible(),spacing: 16)
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(data) { data in
                Card(data: data, currentStep: currentStep)
            }
        }
        .padding(.horizontal)
    }
}


