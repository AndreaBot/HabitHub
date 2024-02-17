//
//  HabitsStorage.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import Foundation

@Observable
class HabitsStorage {
    
    var savedHabits = [HabitModel]()
       
    init(savedHabits: [HabitModel]) {
        self.savedHabits = savedHabits
    }

}
