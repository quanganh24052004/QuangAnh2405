//
//  Log.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct LogItem: View {


    var body: some View {
        HStack (spacing: 0){
            Image("ic_emptyLog")
                .frame(width: 56, height: 56)
                .padding(12)
            
            IndexLog(title: "Pulse", nonValue: "-- bpm")
            IndexLog(title: "HRV", nonValue: "-- ms")
            IndexLog(title: "Status", nonValue: "--")
            
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
    var nonValue: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.neutral3)
                    .frame(height: 20)
                Spacer()
            }
            HStack {
                Text(nonValue)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.neutral2)
                    .frame(height: 32)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    IndexLog(title: "Sample")
}
