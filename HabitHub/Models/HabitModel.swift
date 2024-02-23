//
//  HabitModel.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import Foundation
import SwiftData

@Model
final class HabitModel: Identifiable {
    
    var id: UUID
    var title: String
    var detail: String
    var iconName: String
    var color: String
    var completionCount: Int
    
    init(id: UUID, title: String, detail: String, iconName: String, color: String, completionCount: Int) {
        self.id = UUID()
        self.title = title
        self.detail = detail
        self.iconName = iconName
        self.color = color
        self.completionCount = completionCount
    }
}
