//
//  HabitModel.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import Foundation

struct HabitModel: Identifiable, Codable {
    
    var id = UUID()
    var title: String
    var description: String
    var iconName: String?
    var color: String
}
