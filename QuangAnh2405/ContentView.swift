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
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case .onboarding1:
                    Onboard_1()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case .onboarding2:
                    Onboard_2()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case .onboarding3:
                    Onboard_3()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case .main:
                    Root()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
            }
            .animation(.easeInOut(duration: 0.5), value: navigationManager.currentStep)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationManager())
}
