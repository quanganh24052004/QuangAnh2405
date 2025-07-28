import SwiftUI

struct OnBoarding<Destination: View>: View {
    @AppStorage("onboardingStep") var onboardingStep: Int = 0
    @State private var isActive: Bool = false
    @EnvironmentObject var navigationManager: NavigationManager
    var title: String
    var nextView: () -> Destination
    var data: [CardData]
    
    // Computed property để check validation
    private var canProceed: Bool {
        switch onboardingStep {
        case 1:
            return !navigationManager.selectedCardsOnboarding1.isEmpty
        case 2:
            return !navigationManager.selectedCardsOnboarding2.isEmpty
        case 3:
            return !navigationManager.selectedCardsOnboarding3.isEmpty
        default:
            return true
        }
    }
    
    // Function để get current step
    private func getCurrentStep() -> NavigationManager.OnboardingStep {
        switch onboardingStep {
        case 1:
            return .onboarding1
        case 2:
            return .onboarding2
        case 3:
            return .onboarding3
        default:
            return .intro
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
                CardGrid(data: data, currentStep: getCurrentStep())
                    .padding(.vertical, 1)
            }
            .padding(.vertical, 24)
            
            Spacer()


            ButtonPrimary(title: "Continue", style: .constant(canProceed ? .active : .inactive), isEnabled: .constant(canProceed), action: {
                if canProceed {
                    onboardingStep += 1
                    
                    // Delay navigation để animation hoàn thành trước
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isActive = true
                    }
                }
            })
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .navigationDestination(isPresented: $isActive, destination: nextView)
            .navigationBarBackButtonHidden(true)
        }
        .animation(.easeInOut, value: onboardingStep)
        .background(Color.background1)
    }
}

#Preview {
    OnBoarding(title: "", nextView: { Text("") }, data: [])
}
