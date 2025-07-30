//
//  OB1.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/11/25.
//

import SwiftUI

struct Onboard_3: View {
    var body: some View {
        OnBoarding(
            title: "What type of plan would\nyou like to follow?",
            data: [
               .init(imageCard: "ic_educationalPlan", titleCard: "Educational Plan"),
               .init(imageCard: "ic_exercisePlan", titleCard: "Exercise Plan"),
               .init(imageCard: "ic_healthTests", titleCard: "Health Tests"),
           ],
           nextStep: .main
        )
    }
}

#Preview {
    Onboard_3()
        .environmentObject(NavigationManager())
}
