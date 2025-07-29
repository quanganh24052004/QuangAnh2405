//
//  AddLog.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct AddLog: View {
    @StateObject var userData: UserData
    @StateObject private var logData = LogData()
    @State private var pulseText: String = ""
    @State private var hrvText: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack (spacing: 0) {
            Toolbar(title: "Information", dismiss: _dismiss)
                .padding(.bottom, 24)
            
            HStack (spacing: 16){
                
            }
            Spacer()
            
            

        }
        .navigationBarHidden(true)
    }
}

//#Preview {
//    AddLog()
//}
