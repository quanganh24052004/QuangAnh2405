//
//  File.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentStep: OnboardingStep {
        didSet {
            UserDefaults.standard.set(currentStep.rawValue, forKey: "current_onboarding_step")
        }
    }
    @Published var selectedCardsOnboarding1: [CardData] = []
    @Published var selectedCardsOnboarding2: [CardData] = []
    @Published var selectedCardsOnboarding3: [CardData] = []
    
    // Check if user has completed onboarding
    var hasCompletedOnboarding: Bool {
        return currentStep == .main
    }
    
    enum OnboardingStep: Int, CaseIterable {
        case intro = 0
        case onboarding1 = 1
        case onboarding2 = 2
        case onboarding3 = 3
        case main = 4
        
        var title: String {
            switch self {
            case .intro: return "Welcome"
            case .onboarding1: return "Choose Your Goals"
            case .onboarding2: return "Select Health Focus"
            case .onboarding3: return "Personalize Experience"
            case .main: return "Main App"
            }
        }
    }
    
    // MARK: - Navigation Methods
    func nextStep() {
        guard let currentIndex = OnboardingStep.allCases.firstIndex(of: currentStep),
              currentIndex + 1 < OnboardingStep.allCases.count else { return }
        
        currentStep = OnboardingStep.allCases[currentIndex + 1]
    }
    
    func canProceed() -> Bool {
        switch currentStep {
        case .intro:
            return true // Luôn có thể tiếp tục từ intro
        case .onboarding1:
            return !selectedCardsOnboarding1.isEmpty // Phải chọn ít nhất 1 card
        case .onboarding2:
            return !selectedCardsOnboarding2.isEmpty // Phải chọn ít nhất 1 card
        case .onboarding3:
            return !selectedCardsOnboarding3.isEmpty // Phải chọn ít nhất 1 card
        case .main:
            return false // Không thể proceed từ main
        }
    }
    
    init() {
        // Load saved onboarding step from UserDefaults
        let savedStep = UserDefaults.standard.integer(forKey: "current_onboarding_step")
        self.currentStep = OnboardingStep(rawValue: savedStep) ?? .intro
    }
    
    func resetToIntro() {
        currentStep = .intro
        selectedCardsOnboarding1.removeAll()
        selectedCardsOnboarding2.removeAll()
        selectedCardsOnboarding3.removeAll()
        UserDefaults.standard.removeObject(forKey: "current_onboarding_step")
    }
    
    func completeOnboarding() {
        currentStep = .main
    }
    
    // MARK: - Card Selection
    func toggleCard(_ card: CardData, for step: OnboardingStep) {
        switch step {
        case .onboarding1:
            if let index = selectedCardsOnboarding1.firstIndex(where: { $0.id == card.id }) {
                selectedCardsOnboarding1.remove(at: index)
            } else {
                selectedCardsOnboarding1.append(card)
            }
        case .onboarding2:
            if let index = selectedCardsOnboarding2.firstIndex(where: { $0.id == card.id }) {
                selectedCardsOnboarding2.remove(at: index)
            } else {
                selectedCardsOnboarding2.append(card)
            }
        case .onboarding3:
            if let index = selectedCardsOnboarding3.firstIndex(where: { $0.id == card.id }) {
                selectedCardsOnboarding3.remove(at: index)
            } else {
                selectedCardsOnboarding3.append(card)
            }
        default:
            break
        }
    }
    
    func isCardSelected(_ card: CardData, for step: OnboardingStep) -> Bool {
        switch step {
        case .onboarding1:
            return selectedCardsOnboarding1.contains { $0.id == card.id }
        case .onboarding2:
            return selectedCardsOnboarding2.contains { $0.id == card.id }
        case .onboarding3:
            return selectedCardsOnboarding3.contains { $0.id == card.id }
        default:
            return false
        }
    }
}
