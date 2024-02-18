//
//  HabitDetailView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 18/02/2024.
//

import SwiftUI

struct HabitDetailView: View {
    
    @State var habit: HabitModel
    var allHabits: HabitsStorage
    
    var body: some View {
        ZStack {
            Color(HabitColors.setColor(using: habit.color)).opacity(0.3)
                .ignoresSafeArea()
            
            Form {
                Section {
                    VStack {
                        HStack(spacing: 15) {
                            Image(systemName: habit.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundStyle(HabitColors.setColor(using: habit.color))
                            
                            Text(habit.title)
                                .font(.largeTitle).fontWeight(.bold)
                        }
                        
                        Text(habit.description)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section {
                    VStack {
                        Text("Completion Count")
                        Text(String(habit.completionCount))
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section {
                    Button("Add") {
                        var habitCopy = habit
                        habitCopy.completionCount += 1
                        
                        if let index = allHabits.savedHabits.firstIndex(of: habit) {
                            allHabits.savedHabits[index] = habitCopy
                            habit.completionCount = habitCopy.completionCount
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    HabitDetailView(habit: HabitModel(title: "Play Tennis", description: "I will play tennis three time per week", iconName: "tennisball.fill", color: "yellow", completionCount: 0), allHabits: HabitsStorage())
}



