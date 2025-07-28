//
//  GenderSegmentControl.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct GenderSegmentControl: View {
    @Binding var gender: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Gender")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.neutral2)
                .frame(height: 24)
            
            HStack(spacing: 0) {
                Button(action: {
                    gender = true // Male
                }) {
                    Text("Male")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(gender ? .neutral1 : Color.neutral1)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(gender ? Color.white : Color.clear)
                        .cornerRadius(7)
                }
                
                Button(action: {
                    gender = false // Female
                }) {
                    Text("Female")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(!gender ? .neutral1 : Color.neutral1)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(!gender ? Color.white : Color.clear)
                }
            }
            .background(Color.neutral4)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.neutral4, lineWidth: 3)
            )
        }
    }
}

#Preview {
    GenderSegmentControl(gender: .constant(true))
}
