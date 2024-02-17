//
//  HabitsStorage.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import Foundation

@Observable
class HabitsStorage {
    
    var savedHabits = [HabitModel]() {
        didSet {
            if let data = try? JSONEncoder().encode(savedHabits) {
                UserDefaults.standard.setValue(data, forKey: "allHabits")
            }
        }
    }
    
    init() {
        if let userData = UserDefaults.standard.data(forKey: "allHabits") {
            if let decodedData = try? JSONDecoder().decode([HabitModel].self, from: userData) {
                savedHabits = decodedData
            }
        } else {
            savedHabits = []
        }
    }
}

