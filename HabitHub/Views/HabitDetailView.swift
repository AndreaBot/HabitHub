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
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var updatedDescription = ""
    
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
                                .frame(width: 50)
                                .foregroundStyle(HabitColors.setColor(using: habit.color))
                            
                            Text(habit.title)
                                .font(.largeTitle).fontWeight(.bold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.7)
                                .containerRelativeFrame(.vertical) { size, axis in
                                    size * 0.6
                                }
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
                
                Section {
                    VStack {
                        Button("Edit Description") {
                            showingAlert = true
                        }
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .buttonStyle(.plain)
                        .foregroundStyle(.link)
                        
                        Divider()
                        
                        Button("Edit Color") {
                            showingSheet = true
                        }
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .buttonStyle(.plain)
                        .foregroundStyle(.link)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .sheet(isPresented: $showingSheet, content: {
            ColorGridView(habit: $habit, allHabits: allHabits, showingSheet: $showingSheet)
                .presentationDetents([.fraction(0.4)])
        })
        .alert("New Description", isPresented: $showingAlert) {
            TextField("Type your new description here", text: $updatedDescription)
            Button("Confirm") {
                var habitCopy = habit
                habitCopy.description = updatedDescription
                if let index = allHabits.savedHabits.firstIndex(of: habit) {
                    allHabits.savedHabits[index] = habitCopy
                    habit.description = habitCopy.description
                }
            }
        }
    }
}

#Preview {
    HabitDetailView(habit: HabitModel(title: "Reduce Screen Time", description: "I will play tennis three time per week", iconName: "tennisball.fill", color: "yellow", completionCount: 0), allHabits: HabitsStorage())
}



