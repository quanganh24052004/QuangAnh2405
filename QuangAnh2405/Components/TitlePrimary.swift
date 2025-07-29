//
//  TitlePrimary.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct TitlePrimary: View {
    var title: String = "Health Guru"
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 32))
                .fontWeight(.semibold)
                .foregroundColor(Color.neutral1)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
    }
}

#Preview {
    TitlePrimary()
}

