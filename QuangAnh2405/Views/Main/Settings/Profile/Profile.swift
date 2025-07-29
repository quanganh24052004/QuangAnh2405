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
                
                Text(getBMICategory())
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(getBMIColor())
                
                Rectangle()
                    .frame(height: 0.5)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.line)
                
                HStack (spacing: 0) {
                    VStack (alignment: .center, spacing: 5) {
                        Text("\(userData.weight) kg")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(height: 24)
                            .foregroundColor(getBMIColor())
                        Text("Weight")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(height: 14)
                            .foregroundColor(Color.neutral3)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack (alignment: .center, spacing: 5) {
                        Text("\(userData.weight) cm")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(height: 24)
                            .foregroundColor(getBMIColor())
                        Text("Height")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(height: 14)
                            .foregroundColor(Color.neutral3)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack (alignment: .center, spacing: 5) {
                        Text("20")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(height: 24)
                            .foregroundColor(getBMIColor())
                        Text("Age")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(height: 14)
                            .foregroundColor(Color.neutral3)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack (alignment: .center, spacing: 5) {
                        Text("\(userData.gender)")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(height: 24)
                            .foregroundColor(getBMIColor())
                        Text("Gender")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(height: 14)
                            .foregroundColor(Color.neutral3)
                    }
                    .frame(maxWidth: .infinity)
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
    
    private func getBMICategory() -> String {
        let bmi = calculateBMI()
        
        switch bmi {
        case 0..<18.5:
            return "Underweight"
        case 18.5..<25:
            return "Normal Weight"
        case 25..<30:
            return "Overweight"
        case 30..<35:
            return "Obese Class I"
        case 35..<40:
            return "Obese Class II"
        default:
            return "Obese Class III"
        }
    }
    
    private func getBMIColor() -> Color {
        let bmi = calculateBMI()
        
        switch bmi {
        case 0..<18.5:
            return .low
        case 18.5..<25:
            return .low
        case 25..<30:
            return .good
        case 30..<35:
            return .warning
        case 35..<40:
            return .warning
        default:
            return .red
        }
    }
}

#Preview {
    Profile(userData: UserData())
}
