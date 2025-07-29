//
//  UserData.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    @Published var firstName: String {
        didSet {
            UserDefaults.standard.set(firstName, forKey: "first_name")
        }
    }
    
    @Published var lastName: String {
        didSet {
            UserDefaults.standard.set(lastName, forKey: "last_name")
        }
    }
    
    @Published var weight: Double {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }

    @Published var height: Double {
        didSet {
            UserDefaults.standard.set(height, forKey: "height")
        }
    }

    @Published var gender: Bool {
        didSet {
            UserDefaults.standard.set(gender, forKey: "gender")
        }
    }
    


    init() {
        let firstName = UserDefaults.standard.string(forKey: "first_name") ?? ""
        let lastName = UserDefaults.standard.string(forKey: "last_name") ?? ""
        let weight = UserDefaults.standard.double(forKey: "weight")
        let height = UserDefaults.standard.double(forKey: "height")
        let gender = UserDefaults.standard.bool(forKey: "gender")

        self.firstName = firstName
        self.lastName = lastName
        self.weight = weight
        self.height = height
        self.gender = gender
    }
}


extension Binding where Value == Double {
    func stringBinding(defaultValue: String = "") -> Binding<String> {
        Binding<String>(
            get: { 
                if self.wrappedValue == 0 {
                    return ""
                } else {
                    // Kiểm tra nếu là số nguyên thì hiển thị không có .0
                    if self.wrappedValue.truncatingRemainder(dividingBy: 1) == 0 {
                        return String(Int(self.wrappedValue))
                    } else {
                        return String(self.wrappedValue)
                    }
                }
            },
            set: { newValue in
                if let val = Double(newValue) {
                    self.wrappedValue = val
                } else if newValue.isEmpty {
                    self.wrappedValue = 0
                }
            }
        )
    }
}
