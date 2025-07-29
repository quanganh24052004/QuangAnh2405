//
//  Report.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack {
            Color.background1.ignoresSafeArea(edges: .top)
            VStack (spacing: 0) {
                
                Text("Settings")
                    .font(.system(size:32))
                    .fontWeight(.semibold)
                    .foregroundColor(.neutral1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 44)
                    .padding(.horizontal, 16)
                
                SettingList()
                    .padding(.bottom, 96)
                Spacer()
            }
        }
    }
}

#Preview {
    Settings()
}
