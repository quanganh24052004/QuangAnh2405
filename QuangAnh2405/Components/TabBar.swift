//
//  TabBar.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

enum Tab {
    case report
    case settings
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Button {
                selectedTab = .report
            } label: {
                VStack (spacing: 0) {
                    Image(selectedTab == .report ? "ic_report.fill" : "ic_report")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.top, 4)
                    Text("Report")
                        .font(.system(size: 14, weight: .regular))
                        .frame(height: 20)
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedTab == .report ? .primary1 : .neutral4)
            }
            Button {
                selectedTab = .settings
            } label: {
                VStack (spacing: 0) {
                    Image(selectedTab == .settings ? "ic_settings.fill" : "ic_settings")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.top, 4)
                    Text("Settings")
                        .font(.system(size: 14, weight: .regular))
                        .frame(height: 20)
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedTab == .settings ? .primary1 : .neutral4)
            }
        }
        .padding(.top, 6)
        .padding(.bottom, 26)
//        .frame(height: 80)
        .background(Color.neutral5)
        .clipShape(RoundedCorner(radius: 14, corners: [.topLeft, .topRight]))        .shadow(color: .neutral4, radius: 10, x: 0, y: -5)
    }
}

#Preview {
    TabBar(selectedTab: .constant(.report))
}
