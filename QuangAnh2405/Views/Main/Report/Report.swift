//
//  Report.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct Report: View {
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
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
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
//            .navigationDestination(isPresented: $isActive) {
//                AddLog()
//            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
        }


    }
    
}

#Preview {
    Report()
}
