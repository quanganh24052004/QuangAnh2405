//
//  Card.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct Card: View {
    
    let data: CardData
    let currentStep: NavigationManager.OnboardingStep
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        Button(action: {
            navigationManager.toggleCard(data, for: currentStep)
        }) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(navigationManager.isCardSelected(data, for: currentStep) ? "ic_tickOn" : "ic_tick")
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Image(data.imageCard)
                    .frame(width: 64, height: 64)
                    .padding(.top, 8)
                Spacer()
                HStack (alignment: .bottom, spacing: 0) {
                    Text(data.titleCard)
                        .font(.system(size: 18))
                        .foregroundColor(.neutral2)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .frame(height: 52, alignment: .bottom)
                        .padding(.bottom)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 195)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(navigationManager.isCardSelected(data, for: currentStep) ? Color.primary1 : Color.clear, lineWidth: 1.5)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Card(data: CardData(imageCard: "ic_heartRate", titleCard: "Heart Rate"), currentStep: .onboarding1)
        .environmentObject(NavigationManager())
}
