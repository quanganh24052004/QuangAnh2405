//
//  Log.swift
//  QuangAnh2405
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import Foundation
import SwiftUI

// MARK: - Log Model
struct Log: Identifiable, Codable {
    let id = UUID()
    let pulse: Int
    let hrv: Int
    let date: Date
    let time: Date
    
    var status: HealthStatus {
        return HealthStatus.calculateStatus(pulse: pulse, hrv: hrv)
    }
    
    init(pulse: Int, hrv: Int, date: Date = Date(), time: Date = Date()) {
        self.pulse = max(40, min(120, pulse)) // Validate range 40-120
        self.hrv = max(10, min(150, hrv)) // Validate range 10-150
        self.date = date
        self.time = time
    }
}

// MARK: - Health Status Enum
enum HealthStatus: String, CaseIterable, Codable {
    case bad = "Bad"
    case warning = "Warning"
    case good = "Good"
    
    var color: Color {
        switch self {
        case .bad:
            return .red
        case .warning:
            return .orange
        case .good:
            return .green
        }
    }
    
    static func calculateStatus(pulse: Int, hrv: Int) -> HealthStatus {
        // Logic để xác định status dựa trên Pulse và HRV
        var score = 0
        
        // Pulse scoring (40-120 range)
        if pulse >= 60 && pulse <= 100 {
            score += 2 // Good range
        } else if (pulse >= 50 && pulse < 60) || (pulse > 100 && pulse <= 110) {
            score += 1 // Warning range
        } else {
            score += 0 // Bad range
        }
        
        // HRV scoring (10-150 range)
        if hrv >= 20 && hrv <= 100 {
            score += 2 // Good range
        } else if (hrv >= 15 && hrv < 20) || (hrv > 100 && hrv <= 120) {
            score += 1 // Warning range
        } else {
            score += 0 // Bad range
        }
        
        // Determine final status based on total score
        switch score {
        case 3...4:
            return .good
        case 1...2:
            return .warning
        default:
            return .bad
        }
    }
}

// MARK: - Log Data Manager
class LogData: ObservableObject {
    @Published var logs: [Log] = []
    
    init() {
        loadLogs()
    }
    
    // MARK: - CRUD Operations
    func addLog(pulse: Int, hrv: Int, date: Date = Date(), time: Date = Date()) {
        let newLog = Log(pulse: pulse, hrv: hrv, date: date, time: time)
        logs.append(newLog)
        logs.sort { $0.date > $1.date } // Sort by date descending
        saveLogs()
    }
    
    func removeLog(at indexSet: IndexSet) {
        logs.remove(atOffsets: indexSet)
        saveLogs()
    }
    
    func deleteLog(_ log: Log) {
        if let index = logs.firstIndex(where: { $0.id == log.id }) {
            logs.remove(at: index)
            saveLogs()
        }
    }
    
    // MARK: - Enhanced Data Persistence
    private func saveLogs() {
        do {
            let encoded = try JSONEncoder().encode(logs)
            UserDefaults.standard.set(encoded, forKey: "saved_logs")
            UserDefaults.standard.synchronize() // Force immediate save
        } catch {
            print("Error saving logs: \(error)")
        }
    }
    
    private func loadLogs() {
        do {
            if let data = UserDefaults.standard.data(forKey: "saved_logs") {
                let decoded = try JSONDecoder().decode([Log].self, from: data)
                logs = decoded.sorted { $0.date > $1.date }
            }
        } catch {
            print("Error loading logs: \(error)")
            logs = [] // Reset to empty array if loading fails
        }
    }
    
    // MARK: - Filtering and Statistics
    func logsForDate(_ date: Date) -> [Log] {
        let calendar = Calendar.current
        return logs.filter { log in
            calendar.isDate(log.date, inSameDayAs: date)
        }
    }
    
    func logsForDateRange(from startDate: Date, to endDate: Date) -> [Log] {
        return logs.filter { log in
            log.date >= startDate && log.date <= endDate
        }
    }
    
    var averagePulse: Double {
        guard !logs.isEmpty else { return 0 }
        let total = logs.reduce(0) { $0 + $1.pulse }
        return Double(total) / Double(logs.count)
    }
    
    var averageHRV: Double {
        guard !logs.isEmpty else { return 0 }
        let total = logs.reduce(0) { $0 + $1.hrv }
        return Double(total) / Double(logs.count)
    }
    
    var statusDistribution: [HealthStatus: Int] {
        var distribution: [HealthStatus: Int] = [:]
        for status in HealthStatus.allCases {
            distribution[status] = logs.filter { $0.status == status }.count
        }
        return distribution
    }
    
    // MARK: - Backup and Restore
    func exportLogs() -> Data? {
        do {
            return try JSONEncoder().encode(logs)
        } catch {
            print("Error exporting logs: \(error)")
            return nil
        }
    }
    
    func importLogs(from data: Data) -> Bool {
        do {
            let importedLogs = try JSONDecoder().decode([Log].self, from: data)
            logs = importedLogs.sorted { $0.date > $1.date }
            saveLogs()
            return true
        } catch {
            print("Error importing logs: \(error)")
            return false
        }
    }
    
    // MARK: - Data Validation
    func validateLog(pulse: Int, hrv: Int) -> Bool {
        return pulse >= 40 && pulse <= 120 && hrv >= 10 && hrv <= 150
    }
    
    // MARK: - Data Cleanup
    func clearAllLogs() {
        logs.removeAll()
        saveLogs()
    }
    
    func removeOldLogs(olderThan days: Int) {
        let cutoffDate = Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? Date()
        logs = logs.filter { $0.date >= cutoffDate }
        saveLogs()
    }
}
