//
//  ButtonPrimary.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/11/25.
//

import SwiftUI

enum ButtonPrimaryStyle {
    case active
    case inactive
}

struct ButtonPrimary: View {
    var title: String
    @Binding var style : ButtonPrimaryStyle
    @Binding var isEnabled : Bool
    var action: () -> Void

    private var backgroundColor: Color {
        switch style {
        case .active:
            return .primary1
        case .inactive:
            return .neutral3
        }
    }

    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            Text(title)
                .foregroundStyle(Color.white)
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    ButtonPrimary(title: "Đăng ký", style: .constant(.active), isEnabled: .constant(true)) {
        print("Tapped")
    }
}
