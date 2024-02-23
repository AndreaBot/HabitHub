//
//  NewHabitView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI
import SwiftData

struct NewHabitView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var habitTitle = ""
    @State private var habitDescription = ""
    @State private var habitIcon = "circle.fill"
    @State private var habitColor = ""
    @State private var showingAlert = false
    @FocusState private var txtFieldFocused: Bool
    
    var columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/6))
    ]
    
    var context: ModelContext?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Habit Name", text: $habitTitle)
                        .focused($txtFieldFocused)
                        .padding(.vertical, 8)
                    
                    TextField("Description", text: $habitDescription)
                        .padding(.vertical, 8)
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
                        guard habitTitle != "" else {
                            showingAlert = true
                            return }
                        
                        let newHabit = HabitModel(id: UUID(), title: habitTitle, detail: habitDescription, iconName: habitIcon, color: habitColor, completionCount: 0)
                        context!.insert(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert("Hold on a sec...", isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text("Give the habit a name before proceeding")
            }
        }
    }
}

#Preview {
    NewHabitView()
}

