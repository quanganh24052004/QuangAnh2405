//
//  ContentView.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        Group {
            if navigationManager.hasCompletedOnboarding {
                // User đã hoàn thành onboarding, hiển thị main app
                Root()
            } else {
                // User chưa hoàn thành onboarding, hiển thị onboarding flow
                OnboardingFlow()
            }
        }
    }
}

struct OnboardingFlow: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationStack {
            Group {
                switch navigationManager.currentStep {
                case .intro:
                    Intro()
                case .onboarding1:
                    Onboard_1()
                case .onboarding2:
                    Onboard_2()
                case .onboarding3:
                    Onboard_3()
                case .main:
                    Root()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationManager())
}
