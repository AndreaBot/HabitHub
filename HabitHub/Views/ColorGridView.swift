//
//  ColorGridView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 18/02/2024.
//

import SwiftUI

struct ColorGridView: View {
    
    var columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/6))
    ]
    @Binding var habit: HabitModel
    var allHabits: HabitsStorage
    
    @Binding var showingSheet: Bool
    
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(HabitColors.allColors, id: \.self) { color in
                ColorsGridItemView(iconColor: color, isSelected: color == habit.color)
                    .onTapGesture {
                        var habitCopy = habit
                        habitCopy.color = color
                        if let index = allHabits.savedHabits.firstIndex(of: habit) {
                            allHabits.savedHabits[index] = habitCopy
                            habit.color = habitCopy.color
                            showingSheet = false
                        }
                        
                    }
            }
        }
    }
}

#Preview {
    ColorGridView(habit: .constant(HabitModel(title: "", description: "", iconName: "", color: "", completionCount: 0)), allHabits: HabitsStorage(), showingSheet: .constant(true))
}
