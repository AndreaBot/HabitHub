//
//  HabitDetailView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 18/02/2024.
//

import SwiftUI
import SwiftData

struct HabitDetailView: View {
    
    @State var habit: HabitModel
    var context: ModelContext
    
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
                        
                        Text(habit.detail)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section {
                    VStack {
                        VStack {
                            Text("Completion Count")
                            Text(String(habit.completionCount))
                                .padding(.top, 5)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Divider()
                        
                        Button("Log Completion") {
                            habit.completionCount += 1
                            do {
                                try context.save()
                            } catch {
                                print("There was an error updating the habit: \(error.localizedDescription)")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
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
            
        }
        .scrollContentBackground(.hidden)
        .sheet(isPresented: $showingSheet, content: {
            ColorGridView(habit: $habit, showingSheet: $showingSheet, context: context)
                .presentationDetents([.fraction(0.4)])
            
        })
        .alert("New Description", isPresented: $showingAlert) {
            TextField("Type your new description here", text: $updatedDescription)
            Button("Confirm") {
                habit.detail = updatedDescription
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: HabitModel.self, configurations: config)
    
    return HabitDetailView(habit: HabitModel(id: UUID(), title: "a", detail: "", iconName: "swift", color: "green", completionCount: 6), context: ModelContext(container))
}



