//
//  OB1.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/11/25.
//

import SwiftUI

struct Onboard_2: View {
    
    var body: some View {
        OnBoarding(
            title: "What would you like to \n achieve?",
            data: [
                .init(imageCard: "ic_improveHeartHealth", titleCard: "Improve Heart Health"),
                .init(imageCard: "ic_improveBloodPressureHealth", titleCard: "Improve blood pressure health"),
                .init(imageCard: "ic_reduceStress", titleCard: "Reduce Stress"),
                .init(imageCard: "ic_increaseEnergyLevels", titleCard: "Increase Energy Levels"),
            ],
            nextStep: .onboarding3
        )
    }
}

#Preview {
    Onboard_2()
        .environmentObject(NavigationManager())
}
