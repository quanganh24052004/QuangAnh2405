//
//  OB1.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/11/25.
//

import SwiftUI

struct Onboard_1: View {
    
    var body: some View {
        OnBoarding(
            title: "Which heart health issue\nconcerns you the most?",
            data: [
                .init(imageCard: "ic_heartRate", titleCard: "Heart Rate"),
                .init(imageCard: "ic_highBloodPressure", titleCard: "Hight Blood Pressure"),
                .init(imageCard: "ic_stressAnxiety", titleCard: "Stress & Anxiety"),
                .init(imageCard: "ic_lowEnergyLevels", titleCard: "Low Energy Levels"),
            ],
            nextStep: .onboarding2
        )
    }
}

#Preview {
    Onboard_1()
        .environmentObject(NavigationManager())
}
