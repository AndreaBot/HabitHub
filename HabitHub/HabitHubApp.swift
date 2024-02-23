//
//  HabitHubApp.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI
import SwiftData

@main
struct HabitHubApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: HabitModel.self)
    }
}
