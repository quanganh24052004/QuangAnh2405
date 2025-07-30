//
//  ListLog.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct ListLog: View {
    @ObservedObject var logData: LogData
    
    var body: some View {
        VStack(spacing: 16) {
            if logData.logs.isEmpty {
                SampleLog()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(logData.logs) { log in
                            LogItemView(log: log)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.background1)
    }
}

struct LogItemView: View {
    let log: Log
    
    var body: some View {
        HStack(spacing: 0) {
            Image("ic_emptyLog")
                .frame(width: 56, height: 56)
                .padding(12)
            
            HStack(spacing: 0) {
                IndexLogView(title: "Pulse", value: "\(log.pulse)", subValue: "bpm", valueColor: log.status.color)
                IndexLogView(title: "HRV", value: "\(log.hrv)", subValue: "ms", valueColor: log.status.color)
                IndexLogView(title: "Status", value: log.status.rawValue, valueColor: log.status.color)
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.neutral5)
        .cornerRadius(16)
    }
}

struct IndexLogView: View {
    var title: String = ""
    var value: String = ""
    var subValue: String = ""
    var valueColor: Color = .neutral2
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.neutral3)
                    .frame(height: 20)
                Spacer()
            }
            HStack (spacing: 4) {
                Text(value)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(valueColor)
                    .frame(height: 32)
                Text(subValue)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(valueColor)
                    .frame(height: 28)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ListLog(logData: LogData())
}
