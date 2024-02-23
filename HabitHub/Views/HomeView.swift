//
//  HomeView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var allHabits: [HabitModel]
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allHabits) { habit in
                    NavigationLink(value: habit) {
                        HabitListComponent(habit: habit)
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                       deleteData(allHabits[index])
                    }
                })
            }
            .navigationTitle("HabitHub")
            .sheet(isPresented: $showingSheet, content: {
                NewHabitView(context: modelContext)
            })
            .toolbar {
                ToolbarItemGroup() {
                    Button {
                        showingSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    if !allHabits.isEmpty {
                        EditButton()
                    }
                }
            }
            .navigationDestination(for: HabitModel.self) { habit in
                HabitDetailView(habit: habit, context: modelContext)
            }
        }
       
    }
    
    func deleteData(_ habit: HabitModel) {
        modelContext.delete(habit)
    }
}

#Preview {
    HomeView()
}
