//
//  SettingList.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/23/25.
//

import SwiftUI

struct SettingList: View {
    @Binding var showTabBar: Bool
    @State private var navigateToProfile = false
    @State private var navigateToDailyReminder = false
    @State private var navigateToChangeAppIcon = false
    @State private var navigateToLanguage = false
    @State private var navigateToPrivacyPolicy = false
    @State private var navigateToFeedback = false
    @State private var navigateToTermOfUser = false
    
    // MARK: - Helper Functions
    private func hasUserData() -> Bool {
        let userData = UserData()
        
        // Kiểm tra firstName và lastName từ UserData
        let hasName = !userData.firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                     !userData.lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        // Kiểm tra weight và height có hợp lệ không (không được = 0)
        let hasValidWeight = userData.weight > 0 && userData.weight >= 3 && userData.weight <= 200
        let hasValidHeight = userData.height > 0 && userData.height >= 50 && userData.height <= 230
        
        return hasName && hasValidWeight && hasValidHeight
    }
    
    // MARK: - Navigation Helper
    private func getNavigationAction(for title: String) -> (() -> Void) {
        switch title {
        case "Profile":
            return { navigateToProfile = true }
        case "Daily Reminder":
            return { navigateToDailyReminder = true }
        case "Change App Icon":
            return { navigateToChangeAppIcon = true }
        case "Language":
            return { navigateToLanguage = true }
        case "Privacy Policy":
            return { navigateToPrivacyPolicy = true }
        case "FeedBack":
            return { navigateToFeedback = true }
        case "Term of User":
            return { navigateToTermOfUser = true }
        default:
            return { print("\(title) action called") }
        }
    }
    
    let sections: [SettingSection] = [
        SettingSection(
            header: "",
            items: [
                SettingItem(iconName: "ic_profile", title: "Profile", hasTrailing: true, action: { print("Profile action called") })
            ]
        ),
        SettingSection(
            header: "",
            items: [
                SettingItem(iconName: "ic_dailyReminder", title: "Daily Reminder", hasTrailing: true, action: { print("Daily Reminder") }),
                SettingItem(iconName: "ic_changeAppIcon", title: "Change App Icon", hasTrailing: true, action: { print("Change App Icon") }),
                SettingItem(iconName: "ic_language", title: "Language", hasTrailing: true, action: { print("Language") }),
            ]
        ),
        SettingSection(
            header: "",
            items: [
                SettingItem(iconName: "ic_privacyPolicy", title: "Privacy Policy", hasTrailing: true, action: { print("Privacy Policy") }),
                SettingItem(iconName: "ic_feedBack", title: "FeedBack", hasTrailing: true, action: { print("FeedBack") }),
                SettingItem(iconName: "ic_termOfUser", title: "Term of User", hasTrailing: true, action: { print("Term of User") }),
                SettingItem(iconName: "ic_delete", title: "Clear UserData (Test)", hasTrailing: true, action: {
                    print("Clearing UserDefaults for testing")
                    UserDefaults.standard.removeObject(forKey: "UserInfo")
                    UserDefaults.standard.synchronize()
                    print("UserDefaults cleared")
                }),
            ]
        )]
    
    var body: some View {
        NavigationStack {
            VStack {
                TitlePrimary(title: "Settings")
                    .padding(.horizontal, 16)
                List {
                    Section {
                    Image("img_premium")
                        .resizable()
                        .scaledToFit()
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .cornerRadius(16)

                    ForEach(sections) { section in
                        Section {
                            ForEach(section.items) { item in
                                Setting(
                                    iconName: item.iconName,
                                    title: item.title,
                                    trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                    action: item.title == "Clear UserData (Test)" ? item.action : getNavigationAction(for: item.title)
                                )
                                .listRowBackground(Color.neutral5)
                                .listRowInsets(EdgeInsets())
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                        }
                        .padding(.vertical, 4)
                        .cornerRadius(12)
                    }
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
//                .listSectionSpacing(16)
            }
            .background(Color.background1)
            .padding(.bottom, 56)
            .navigationDestination(isPresented: $navigateToProfile) {
                if hasUserData() {
                    Profile(userData: UserData())
                        .onAppear { showTabBar = false }
                        .onDisappear { showTabBar = true }
                } else {
                    InsertProfile(userData: UserData())
                        .onAppear { showTabBar = false }
                        .onDisappear {
                            showTabBar = true
                            // Kiểm tra lại sau khi user save data
                            if hasUserData() {
                                navigateToProfile = false
                            }
                        }
                }
            }
            .navigationDestination(isPresented: $navigateToDailyReminder) {
                DailyReminderView(navigateToDailyReminder: $navigateToDailyReminder)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
            .navigationDestination(isPresented: $navigateToChangeAppIcon) {
                ChangeAppIconView(navigateToChangeAppIcon: $navigateToChangeAppIcon)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
            .navigationDestination(isPresented: $navigateToLanguage) {
                LanguageView(navigateToLanguage: $navigateToLanguage)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
            .navigationDestination(isPresented: $navigateToPrivacyPolicy) {
                PrivacyPolicyView(navigateToPrivacyPolicy: $navigateToPrivacyPolicy)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
            .navigationDestination(isPresented: $navigateToFeedback) {
                FeedbackView(navigateToFeedback: $navigateToFeedback)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
            .navigationDestination(isPresented: $navigateToTermOfUser) {
                TermOfUserView(navigateToTermOfUser: $navigateToTermOfUser)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            }
        }
    }
}

#Preview {
    SettingList(showTabBar: .constant(true))
}

// MARK: - Phẩn mở rộng
struct DailyReminderView: View {
    @Binding var navigateToDailyReminder: Bool
    
    var body: some View {
        VStack {
            HStack {
            }
        }
        .background(Color.background1)
    }
}

struct ChangeAppIconView: View {
    @Binding var navigateToChangeAppIcon: Bool
    
    var body: some View {
        VStack {
            HStack {
            }
        }
        .background(Color.background1)
    }
}

struct LanguageView: View {
    @Binding var navigateToLanguage: Bool
    
    var body: some View {
        VStack {
            HStack {
            }
        }
        .background(Color.background1)
    }
}

struct PrivacyPolicyView: View {
    @Binding var navigateToPrivacyPolicy: Bool
    
    var body: some View {
        VStack {
        }
    }
}

struct FeedbackView: View {
    @Binding var navigateToFeedback: Bool
    
    var body: some View {
        VStack {
        }
        .background(Color.background1)
    }
}

struct TermOfUserView: View {
    @Binding var navigateToTermOfUser: Bool
    
    var body: some View {
        VStack {
        }
        .background(Color.background1)
    }
}
