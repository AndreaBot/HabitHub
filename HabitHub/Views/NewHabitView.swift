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
    @FocusState private var txtFieldFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $habitTitle)
                    .focused($txtFieldFocused)
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .background(.mint)
            .onAppear(perform: {
                txtFieldFocused = true
            })
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        let newHabit = HabitModel(title: habitTitle)
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

