//
//  Log.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct LogItem: View {


    var body: some View {
        HStack {
            Image("ic_emptyLog")
                .frame(width: 56, height: 56)
                .padding(12)
            
            IndexLog(title: "Pulse")
            IndexLog(title: "HRV")
            IndexLog(title: "Status")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.neutral5)
        .cornerRadius(16)
    }
}

#Preview {
    LogItem()
}

struct IndexLog: View {
    var title: String = ""
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.neutral3)
                .frame(height: 20)
            Text("Index")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.neutral2)
                .frame(height: 32)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    IndexLog(title: "Sample")
}
