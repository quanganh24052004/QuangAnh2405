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
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.gray)
        .cornerRadius(16)
        
    }
}

#Preview {
    LogItem()
}

struct IndexLog: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("Tilte")
            Text("Index")
        }
    }
}

#Preview {
    IndexLog()
}
