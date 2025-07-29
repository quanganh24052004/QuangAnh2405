//
//  Profile.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct Profile: View {
    
    @ObservedObject var userData: UserData
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            FullToolbar(title: "Profile", dismiss: _dismiss)
                .padding(.bottom, 24)
            VStack(spacing: 24) {
                Image("ic_avatar")
                    .resizable()
                    .frame(width: 108, height: 108)
                Text("\(userData.firstName) \(userData.lastName)")
                    .font(.system(size: 36))
                    .fontWeight(.semibold)
                    .foregroundColor(.neutral2)
            }
            .padding(.bottom, 20)
            
            VStack(spacing: 12) {
                Text("Your BMI:")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.neutral1)
                
                Text(String(format: "%.1f", calculateBMI()))
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(getBMIColor())
                    .frame(height: 64)
                
                Rectangle()
                    .frame(height: 0.5)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.line)
                
                HStack(spacing: 0) {
                    ProfileInfoCard(
                        value: "\(Int(userData.weight)) kg",
                        title: "Weight",
                        color: getBMIColor()
                    )
                    Spacer()
                    ProfileInfoCard(
                        value: "\(Int(userData.height)) cm",
                        title: "Height",
                        color: getBMIColor()
                    )
                    Spacer()
                    ProfileInfoCard(
                        value: "20",
                        title: "Age",
                        color: getBMIColor()
                    )
                    Spacer()
                    ProfileInfoCard(
                        value: userData.gender ? "Male" : "Female",
                        title: "Gender",
                        color: getBMIColor()
                    )
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.neutral5)
            .cornerRadius(16)
            .padding(.horizontal, 31.5)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.background1)
    }
    
    // MARK: - BMI Calculation Functions
    private func calculateBMI() -> Double {
        guard userData.height > 0 else { return 0 }
        let heightInMeters = userData.height / 100
        return userData.weight / (heightInMeters * heightInMeters)
    }
    
    private func getBMIColor() -> Color {
        let bmi = calculateBMI()
        
        switch bmi {
        case ..<18.5:
            return .low
        case 18.5..<25:
            return .good
        default:
            return .warning
        }
    }
}

#Preview {
    Profile(userData: UserData())
}

// MARK: - Reusable Profile Info Card
struct ProfileInfoCard: View {
    let value: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(value)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(height: 24)
                .foregroundColor(color)
            
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .frame(height: 14)
                .foregroundColor(Color.neutral3)
        }
//        .frame(maxWidth: .infinity)
    }
}
