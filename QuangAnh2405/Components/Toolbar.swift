//
//  BackLeftButton.swift
//  SwiftUI_250708
//
//  Created by iKame Elite Fresher 2025 on 7/11/25.
//

import SwiftUI

struct Toolbar: View {
    var buttonLeft: String = ""
    let title: String
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(buttonLeft)
                    .foregroundColor(Color.neutral2)
                    .font(.system(size: 16, weight: .bold))
            }

            Spacer()

            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.neutral1)
                .frame(height: 28)

            Spacer()
            
            Rectangle()
                .frame(width: 24, height:24)
                .foregroundColor(Color.clear)
        }
        .padding(.horizontal)
        .frame(height: 44)
    }
}

struct FullToolbar: View {
    let title: String
    @Environment(\.dismiss) var dismiss
    var editAction: (() -> Void)? = nil

    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image("ic_buttonBack")
                    .foregroundColor(Color.neutral2)
                    .font(.system(size: 16, weight: .semibold))
            }

            Spacer()

            // Title
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.neutral1)

            Spacer()
            
            if let editAction = editAction {
                Button(action: editAction) {
                    Text("Edit")
                        .foregroundColor(Color.primary1)
                        .font(.system(size: 16, weight: .semibold))
                }
            } else {
                EditButton()
            }
        }
        .padding(.horizontal)
        .frame(height: 44)
        .background(Color.clear)
    }
}

struct EditButton: View {
    var body: some View {
        Button(action: {
            print("Edit")
        }) {
            Text("Edit")
                .foregroundColor(Color.primary1)
                .font(.system(size: 16, weight: .semibold))
        }
    }
}

struct AddProfile: View {
    var body: some View {
        Button(action: {
            print("AddProfile")
        }) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color.primary)
                .font(.system(size: 16, weight: .semibold))
                .frame(height: 24)
        }
    }
}

#Preview {
    Toolbar(title: "Information")
}

#Preview {
    FullToolbar(title: "Information")
}

#Preview {
    EditButton()
}

#Preview {
    AddProfile()
}
