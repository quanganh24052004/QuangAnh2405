//
//  Report.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct Report: View {
    @State var isActive: Bool = false
    @StateObject private var logData = LogData()
    @Binding var showTabBar: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TitlePrimary(title: "Health Guru")

                Button(action: {
                    isActive = true
                }) {
                    Image("img_tapToLog")
                        .resizable()
                        .frame(width: 263)
                        .frame(height: 241)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 65)
                }
                
                ListLog(logData: logData)
                
                Spacer()
            }
            .padding(.bottom, 96)
            .navigationDestination(isPresented: $isActive) {
                AddLog(userData: UserData(), logData: logData, showTabBar: $showTabBar)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
            .background(Color.background1)
        }
    }
}

//#Preview {
//    Report()
//}

struct SampleLog: View {
    var body: some View {
        VStack (spacing: 24) {
            LogItem()
            
            VStack (spacing: 4) {
                HStack (spacing: 4) {
                    Image("ic_trackDaily")
                        .frame(width: 28, height: 28)
                    Text("Track daily")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(height: 24)
                    Spacer()
                }
                .frame(height: 24)
                HStack {
                    Text("Click heart icon to log your data")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .frame(height: 20)
                        .foregroundColor(.neutral2)
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color.neutral5)
            .cornerRadius(16)
        }
    }
}
