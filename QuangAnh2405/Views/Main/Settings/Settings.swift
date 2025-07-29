//
//  Report.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack (spacing: 0) {
            
            TitlePrimary(title: "Settings")
                .padding(.horizontal, 16)
            
            SettingList()
                .padding(.bottom, 96)
            Spacer()
        }
        .background(Color.background1)
    }
}

#Preview {
    Settings()
}
