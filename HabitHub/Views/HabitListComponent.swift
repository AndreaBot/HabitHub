//
//  HabitListComponent.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct HabitListComponent: View {
    
    let habit: HabitModel
    
    var body: some View {
        HStack {
            Image(systemName: habit.iconName ?? "command")
                .padding(10)
                .foregroundStyle(HabitColors.setColor(using: habit.color))
                .background(HabitColors.setColor(using: habit.color).opacity(0.3))
                .clipShape(Circle())
            Text(habit.title)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
    
    
}

#Preview {
    HabitListComponent(habit: HabitModel(id: UUID(), title: "Code", description: "This is a description", iconName: "swift", color: "red"))
}
