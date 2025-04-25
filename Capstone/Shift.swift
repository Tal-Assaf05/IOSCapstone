//
//  Shift.swift
//  Capstone
//
//  Created by Tal Assaf on 4/24/25.
//


import Foundation

struct Shift: Codable {
    var id = UUID()
    var date: Date
    var startTime: Date
    var endTime: Date
    var customerName: String
    var hourlyRate: Double
    var notes: String
    var isPaid: Bool

    var totalEarnings: Double {
        let duration = endTime.timeIntervalSince(startTime) / 3600
        return round(duration * hourlyRate * 100) / 100 // Rounded to 2 decimal places
    }
}
