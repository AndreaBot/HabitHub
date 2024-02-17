//
//  IconsGridView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct IconsGridItemView: View {
    
    var iconName: String
    var isSelected: Bool
    
    var body: some View {
        Image(systemName: iconName)
            .padding(10)
            .overlay {
                Circle()
                    .stroke(.mint, lineWidth: isSelected ? 3 : 0)
            }
    }
}

#Preview {
    IconsGridItemView(iconName: "swift", isSelected: true)
}
