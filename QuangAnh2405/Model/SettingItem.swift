//
//  SettingItem.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/23/25.
//

import Foundation

struct SettingItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let hasTrailing: Bool
    let action: () -> Void
}

struct SettingSection: Identifiable {
    let id = UUID()
    let header: String
    let items: [SettingItem]
}
