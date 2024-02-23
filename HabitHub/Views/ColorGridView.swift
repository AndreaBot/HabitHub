//
//  ColorGridView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 18/02/2024.
//

import SwiftUI
import SwiftData

struct ColorGridView: View {
    
    var columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/6))
    ]
    
    @Binding var habit: HabitModel
    @Binding var showingSheet: Bool
    
    var context: ModelContext
    @Query var allHabits: [HabitModel]
    
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(HabitColors.allColors, id: \.self) { color in
                ColorsGridItemView(iconColor: color, isSelected: color == habit.color)
                    .onTapGesture {
                        habit.color = color
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        showingSheet = false
                    }
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: HabitModel.self, configurations: config)
    
    return ColorGridView(habit: .constant(HabitModel(id: UUID(), title: "", detail: "", iconName: "", color: "", completionCount: 0)), showingSheet: .constant(true), context: ModelContext(container))
}
