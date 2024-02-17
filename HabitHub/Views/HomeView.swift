//
//  HomeView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var allHabits = [HabitModel]()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List(allHabits) { habit in
                Text(habit.title)
            }
            .navigationTitle("HabitHub")
            .sheet(isPresented: $showingSheet, content: {
                NewHabitView()
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
