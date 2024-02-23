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
        HStack(spacing: 20) {
            Image(systemName: habit.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding()
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
    HabitListComponent(habit: HabitModel(id: UUID(), title: "Code", detail: "This is a description", iconName: "swift", color: "red", completionCount: 0))
}
