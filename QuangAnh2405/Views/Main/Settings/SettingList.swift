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
    
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    // MARK: - Helper Functions
    private func hasUserData() -> Bool {
        let hasName = !firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                     !lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        // Kiểm tra weight và height có hợp lệ không
        let userData = UserData()
        let hasValidWeight = userData.weight >= 3 && userData.weight <= 200
        let hasValidHeight = userData.height >= 50 && userData.height <= 230
        
        return hasName && hasValidWeight && hasValidHeight
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
        Group {
            if navigateToProfile {
                if hasUserData() {
                    Profile(userData: UserData())
                        .onAppear { showTabBar = false }
                        .onDisappear { showTabBar = true }
                } else {
                    NavigationStack {
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
            } else if navigateToDailyReminder {
                DailyReminderView(navigateToDailyReminder: $navigateToDailyReminder)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else if navigateToChangeAppIcon {
                ChangeAppIconView(navigateToChangeAppIcon: $navigateToChangeAppIcon)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else if navigateToLanguage {
                LanguageView(navigateToLanguage: $navigateToLanguage)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else if navigateToPrivacyPolicy {
                PrivacyPolicyView(navigateToPrivacyPolicy: $navigateToPrivacyPolicy)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else if navigateToFeedback {
                FeedbackView(navigateToFeedback: $navigateToFeedback)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else if navigateToTermOfUser {
                TermOfUserView(navigateToTermOfUser: $navigateToTermOfUser)
                    .onAppear { showTabBar = false }
                    .onDisappear { showTabBar = true }
            } else {
                VStack {
                    TitlePrimary(title: "Settings")
                        .padding(.horizontal, 16)
                    
                    List {
                        ForEach(sections) { section in
                            Section {
                                ForEach(section.items) { item in
                                    if item.title == "Profile" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToProfile = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "Daily Reminder" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToDailyReminder = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "Change App Icon" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToChangeAppIcon = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "Language" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToLanguage = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "Privacy Policy" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToPrivacyPolicy = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "FeedBack" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToFeedback = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else if item.title == "Term of User" {
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: {
                                                navigateToTermOfUser = true
                                            }
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    } else {
                                        // Other items (like Clear UserData)
                                        Setting(
                                            iconName: item.iconName,
                                            title: item.title,
                                            trailingIcon: item.hasTrailing ? Image("ic_buttonRight") : nil,
                                            action: item.action
                                        )
                                        .listRowInsets(EdgeInsets())
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                            .cornerRadius(12)
                        }
                    }
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .listSectionSpacing(16)
                }
                .padding(.bottom, 96)

            }
        }
        .animation(.easeInOut(duration: 0.3), value: navigateToProfile)
        .animation(.easeInOut(duration: 0.3), value: navigateToDailyReminder)
        .animation(.easeInOut(duration: 0.3), value: navigateToChangeAppIcon)
        .animation(.easeInOut(duration: 0.3), value: navigateToLanguage)
        .animation(.easeInOut(duration: 0.3), value: navigateToPrivacyPolicy)
        .animation(.easeInOut(duration: 0.3), value: navigateToFeedback)
        .animation(.easeInOut(duration: 0.3), value: navigateToTermOfUser)
    }
    
    
    

}

#Preview {
    SettingList(showTabBar: .constant(true))
}

// MARK: - Placeholder Views for Navigation
struct DailyReminderView: View {
    @Binding var navigateToDailyReminder: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToDailyReminder = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Daily Reminder")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            VStack {
                Text("Daily Reminder")
                    .font(.title)
                    .padding()
                Text("Configure your daily reminder settings here")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.background1)
    }
}

struct ChangeAppIconView: View {
    @Binding var navigateToChangeAppIcon: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToChangeAppIcon = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Change App Icon")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            VStack {
                Text("Change App Icon")
                    .font(.title)
                    .padding()
                Text("Choose your preferred app icon here")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.background1)
    }
}

struct LanguageView: View {
    @Binding var navigateToLanguage: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToLanguage = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Language")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            VStack {
                Text("Language")
                    .font(.title)
                    .padding()
                Text("Select your preferred language here")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.background1)
    }
}

struct PrivacyPolicyView: View {
    @Binding var navigateToPrivacyPolicy: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToPrivacyPolicy = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Privacy Policy")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Privacy Policy")
                        .font(.title)
                        .padding(.bottom)
                    
                    Text("This is the privacy policy content. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding(.bottom)
                    
                    Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        .padding(.bottom)
                    
                    Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                }
                .padding()
            }
        }
        .background(Color.background1)
    }
}

struct FeedbackView: View {
    @Binding var navigateToFeedback: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToFeedback = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Feedback")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            VStack {
                Text("Feedback")
                    .font(.title)
                    .padding()
                Text("Share your feedback with us here")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.background1)
    }
}

struct TermOfUserView: View {
    @Binding var navigateToTermOfUser: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    navigateToTermOfUser = false
                }
                .foregroundColor(.blue)
                Spacer()
                Text("Terms of Use")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Terms of Use")
                        .font(.title)
                        .padding(.bottom)
                    
                    Text("These are the terms of use. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding(.bottom)
                    
                    Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        .padding(.bottom)
                    
                    Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                }
                .padding()
            }
        }
        .background(Color.background1)
    }
}
