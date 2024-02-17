//
//  NewHabitView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct NewHabitView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var allHabits: HabitsStorage
    
    @State private var habitTitle = ""
    @State private var habitIcon = ""
    @State private var habitColor = ""
    @FocusState private var txtFieldFocused: Bool

    var columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/6))
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Habit Name", text: $habitTitle)
                        .focused($txtFieldFocused)
                }
                
                Section("Select an icon") {
                    LazyVGrid(columns: columns) {
                        ForEach(HabitIcons.allIcons, id: \.self) { icon in
                            IconsGridItemView(iconName: icon, isSelected: icon == habitIcon)
                                .onTapGesture {
                                    habitIcon = icon
                                }
                        }
                    }
                }
                
                Section("Select a color") {
                    LazyVGrid(columns: columns) {
                        ForEach(HabitColors.allColors, id: \.self) { color in
                            ColorsGridItemView(iconColor: color, isSelected: color == habitColor)
                                .onTapGesture {
                                    habitColor = color
                                }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(.mint)
            .onAppear(perform: {
                txtFieldFocused = true
            })
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        let newHabit = HabitModel(title: habitTitle, iconName: habitIcon, color: habitColor)
                        allHabits.savedHabits.append(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewHabitView(allHabits: HabitsStorage())
}

