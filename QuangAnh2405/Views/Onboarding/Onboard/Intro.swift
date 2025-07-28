import SwiftUI

struct Intro: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 36)
            
            // Tiêu đề
            Text("Health Plan Pro")
                .font(.system(size: 26, weight: .bold))
                .frame(height: 38)
                .foregroundColor(.neutral1)
            
            // Mô tả phụ
            Text("Providing workout routines and health\ninformation to support well-being.")
                .font(.system(size: 16, weight: .medium))
                .frame(height: 48)
                .lineSpacing(6)
                .foregroundColor(.neutral3)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
            
            Spacer()
            
            Image("img_preview")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 32)
            
            Spacer()
            
            // Nut Continue
            ButtonPrimary(title: "Continue", style: .constant(.active), isEnabled: .constant(true), action: {
                navigationManager.currentStep = .onboarding1
            })
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background1)
    }
}

#Preview {
    Intro()
}
