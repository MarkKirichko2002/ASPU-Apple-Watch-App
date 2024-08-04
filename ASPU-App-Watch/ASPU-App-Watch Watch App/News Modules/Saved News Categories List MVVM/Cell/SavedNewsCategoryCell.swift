//
//  SavedNewsCategoryCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.07.2024.
//

import SwiftUI

struct SavedNewsCategoryCell: View {
    
    var category: NewsCategoryModel
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(category.name)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(category.name)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    SavedNewsCategoryCell(category: NewsCategories.categories[0], isSelected: true)
}
