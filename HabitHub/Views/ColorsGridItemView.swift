//
//  ColorsGridItemView.swift
//  HabitHub
//
//  Created by Andrea Bottino on 17/02/2024.
//

import SwiftUI

struct ColorsGridItemView: View {
    var iconColor: String
    var isSelected: Bool
    
    var body: some View {
        Circle()
            .padding(10)
            .foregroundStyle((HabitColors.setColor(using: iconColor)))
            .overlay {
                Circle()
                    .stroke(.mint, lineWidth: isSelected ? 5 : 0)
            }
    }
}

#Preview {
    ColorsGridItemView(iconColor: "purple", isSelected: true)
}
