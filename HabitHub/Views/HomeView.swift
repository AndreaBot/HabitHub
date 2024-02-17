//
//  HomeView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var allHabits = HabitsStorage()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allHabits.savedHabits) { habit in
                    Text(habit.title)
                }
                .onDelete(perform: { index in
                    allHabits.savedHabits.remove(atOffsets: index)
                })
            }
            .navigationTitle("HabitHub")
            .sheet(isPresented: $showingSheet, content: {
                NewHabitView(allHabits: allHabits)
            })
            .toolbar {
                ToolbarItemGroup() {
                    Button {
                        showingSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    if !allHabits.savedHabits.isEmpty {
                        
                        EditButton()
                    }
                }
            }
        }
    }
}



#Preview {
    HomeView()
}
