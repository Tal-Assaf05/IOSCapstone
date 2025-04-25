//
//  ShiftStorage.swift
//  Capstone
//
//  Created by Tal Assaf on 4/24/25.
//

import Foundation

class ShiftStorage {
    private let key = "savedShifts"

    func saveShifts(_ shifts: [Shift]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(shifts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func loadShifts() -> [Shift] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? decoder.decode([Shift].self, from: data) {
            return decoded
        }
        return []
    }

    func addShift(_ newShift: Shift) {
        var current = loadShifts()
        current.append(newShift)
        saveShifts(current)
    }

    func deleteShift(at index: Int) {
        var current = loadShifts()
        guard index >= 0 && index < current.count else { return }
        current.remove(at: index)
        saveShifts(current)
    }

    func updateShift(at index: Int, with updatedShift: Shift) {
        var current = loadShifts()
        guard index >= 0 && index < current.count else { return }
        current[index] = updatedShift
        saveShifts(current)
    }
}
