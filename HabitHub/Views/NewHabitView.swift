//
//  NewHabitView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct NewHabitView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var habitTitle = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $habitTitle)
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .background(.mint)
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        //add habit
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
    NewHabitView()
}
