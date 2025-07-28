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
        VStack(spacing: 20) {
            Text("Dữ liệu bạn đã nhập:")
                .font(.headline)
            Text(userData.firstName)
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            Text(userData.lastName)
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            Text(String(format: "%.0f", userData.weight))
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            Text(String(format: "%.0f", userData.height))
                .font(.title)
                .bold()
                .foregroundColor(.blue)

                    Button("Quay lại để chỉnh sửa") {
                        dismiss()
                    }
                }
                .padding()
                .navigationTitle("Màn hình 2")
    }
}
//
//#Preview {
//    Profile()
//}
