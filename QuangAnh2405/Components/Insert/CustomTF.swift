//
//  CustomTF.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct CustomTF: View {
    
    @Binding var text: String
    
    var title : String
    var placeholder : String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.neutral2)
                .frame(height: 24)

            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundColor(Color.neutral3)
            )
            .keyboardType(keyboardType)
            .font(.system(size: 16))
            .padding(.leading, 12)
            .padding(.vertical, 14)
            .frame(height: 52)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.neutral4, lineWidth: 1)
            )
            .cornerRadius(16)

        }
    }
}



#Preview {
    VStack(spacing: 20) {
        CustomTF(text: .constant("Quang Anh"), title: "Tilte", placeholder: "Placeholder")
        GenderSegmentControl(gender: .constant(true))
    }
    .padding()
}
