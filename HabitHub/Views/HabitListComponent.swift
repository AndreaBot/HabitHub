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
            Text(habit.title)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.secondary)
    }
}

#Preview {
    HabitListComponent(habit: HabitModel(id: UUID(), title: "Code", iconName: "swift"))
}
