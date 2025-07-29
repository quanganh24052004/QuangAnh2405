import SwiftUI

struct OnBoarding: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var title: String
    var data: [CardData]
    var nextStep: NavigationManager.OnboardingStep
    
    // Computed property để check validation
    private var canProceed: Bool {
        switch navigationManager.currentStep {
        case .onboarding1:
            return !navigationManager.selectedCardsOnboarding1.isEmpty
        case .onboarding2:
            return !navigationManager.selectedCardsOnboarding2.isEmpty
        case .onboarding3:
            return !navigationManager.selectedCardsOnboarding3.isEmpty
        default:
            return true
        }
    }
    
    var body: some View {
        VStack (spacing: 0) {
            Text(title)
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(Color.neutral1)
                .multilineTextAlignment(.center)
                .lineSpacing(12)
                .frame(maxHeight: 76)
                .padding(.top, 70)

            
            ScrollView {
                CardGrid(data: data, currentStep: navigationManager.currentStep)
                    .padding(.vertical, 1)
            }
            .padding(.vertical, 24)
            
            Spacer()

            ButtonPrimary(title: "Continue", style: .constant(canProceed ? .active : .inactive), isEnabled: .constant(canProceed), action: {
                if canProceed {
                    // Nếu đã hoàn thành onboarding 3, complete onboarding
                    if navigationManager.currentStep == .onboarding3 {
                        navigationManager.completeOnboarding()
                    } else {
                        // Chuyển đến step tiếp theo
                        navigationManager.currentStep = nextStep
                    }
                }
            })
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
        .animation(.easeInOut(duration: 0.3), value: navigationManager.currentStep)
        .background(Color.background1)
    }
}

#Preview {
    OnBoarding(title: "Test", data: [], nextStep: .onboarding1)
        .environmentObject(NavigationManager())
}
