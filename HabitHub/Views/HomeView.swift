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
            List(allHabits.savedHabits) { habit in
                Text(habit.title)
            }
            .navigationTitle("HabitHub")
            .sheet(isPresented: $showingSheet, content: {
                NewHabitView(allHabits: allHabits)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
