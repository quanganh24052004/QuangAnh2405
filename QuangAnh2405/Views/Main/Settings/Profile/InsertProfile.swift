//
//  InsertProfile.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct InsertProfile: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var userData: UserData
    
    // Validation computed properties
    private var isFirstNameValid: Bool {
        !userData.firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        userData.firstName.range(of: "^[a-zA-ZÀ-ỹ\\s]+$", options: .regularExpression) != nil
    }
    
    private var isLastNameValid: Bool {
        !userData.lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        userData.lastName.range(of: "^[a-zA-ZÀ-ỹ\\s]+$", options: .regularExpression) != nil
    }
    
    private var isWeightValid: Bool {
        userData.weight >= 3 && userData.weight <= 200
    }
    
    private var isHeightValid: Bool {
        userData.height >= 50 && userData.height <= 230
    }
    
    private var isFormValid: Bool {
        isFirstNameValid && isLastNameValid && isWeightValid && isHeightValid
    }
    
    var body: some View {
        NavigationStack {
            Toolbar(buttonLeft: "ic_buttonBack", title: "Information", dismiss: _dismiss)
            VStack (spacing: 21) {
                HStack (spacing: 12) {
                    CustomTF(
                        text: $userData.firstName,
                        title: "First Name",
                        placeholder: "Enter firstname...",
                        keyboardType: .default
                    )
                    CustomTF(
                        text: $userData.lastName,
                        title: "Last Name",
                        placeholder: "Enter lastname...",
                        keyboardType: .default
                    )
                }
                
                GenderSegmentControl(gender: $userData.gender)
                
                HStack (spacing: 16) {
                    CustomTF(
                        text: $userData.weight.stringBinding(),
                        title: "Weight (kg)",
                        placeholder: "Enter weight...",
                        keyboardType: .decimalPad
                    )
                    CustomTF(
                        text: $userData.height.stringBinding(),
                        title: "Height (cm)",
                        placeholder: "Enter height...",
                        keyboardType: .decimalPad
                    )
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    if !isFirstNameValid && !userData.firstName.isEmpty {
                        Text("First name must contain only letters")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    
                    if !isLastNameValid && !userData.lastName.isEmpty {
                        Text("Last name must contain only letters")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    
                    if !isWeightValid && userData.weight != 0 {
                        Text("Weight must be between 3-200 kg")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    
                    if !isHeightValid && userData.height != 0 {
                        Text("Height must be between 50-230 cm")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                ButtonPrimary(
                    title: "Update",
                    style: .constant(isFormValid ? .active : .inactive),
                    isEnabled: .constant(isFormValid),
                    action: {
                        dismiss()
                    }
                )

            }
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.background1)
    }
}

#Preview {
    InsertProfile(userData: UserData())
}
