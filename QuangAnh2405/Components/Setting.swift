//
//  Setting.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/23/25.
//

import SwiftUI

struct Setting: View {
    var iconName: String
    var title: String
    var trailingIcon: Image? = Image("ic_buttonRight")
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack (spacing: 12) {
                Image(iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.neutral1)
                    .frame(height: 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let trailingIcon = trailingIcon {
                    trailingIcon
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, maxHeight: 28)
            .background(Color.white)
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Setting(iconName: "ic_profile", title: "Profile")
}
