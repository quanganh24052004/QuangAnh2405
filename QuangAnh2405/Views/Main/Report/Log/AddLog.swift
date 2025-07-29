//
//  AddLog.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct AddLog: View {
    @StateObject var userData: UserData
    @StateObject var logData: LogData
    @Binding var showTabBar: Bool
    @State private var pulseText: String = ""
    @State private var hrvText: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 0) {
            Toolbar(title: "Add Health Log", dismiss: _dismiss)
                .padding(.bottom, 24)
            
            HStack(spacing: 12) {
                CustomTF(
                    text: $pulseText,
                    title: "Pulse",
                    placeholder: "Enter pulse (40-120)",
                    keyboardType: .numberPad
                )
                CustomTF(
                    text: $hrvText,
                    title: "HRV",
                    placeholder: "Enter HRV (10-150)",
                    keyboardType: .numberPad
                )
            }
            .padding(.horizontal, 16)

            Spacer()
            
            ButtonPrimary(
                title: "Save",
                style: .constant(canSave ? .active : .inactive),
                isEnabled: .constant(canSave),
                action: saveLog
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background1)
        .navigationBarHidden(true)
        .onAppear {
            showTabBar = false
        }
        .onDisappear {
            showTabBar = true
        }
        .alert("Error", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    // MARK: - Computed Properties
    private var canSave: Bool {
        guard let pulse = Int(pulseText), let hrv = Int(hrvText) else {
            return false
        }
        return logData.validateLog(pulse: pulse, hrv: hrv)
    }
    
    // MARK: - Actions
    private func saveLog() {
        guard let pulse = Int(pulseText), let hrv = Int(hrvText) else {
            showAlert("Please enter valid numbers for both Pulse and HRV")
            return
        }
        
        guard logData.validateLog(pulse: pulse, hrv: hrv) else {
            showAlert("Pulse must be between 40-120 and HRV must be between 10-150")
            return
        }
        
        logData.addLog(pulse: pulse, hrv: hrv)
        dismiss()
    }
    
    private func showAlert(_ message: String) {
        alertMessage = message
        showingAlert = true
    }
}

//#Preview {
//    AddLog()
//}
