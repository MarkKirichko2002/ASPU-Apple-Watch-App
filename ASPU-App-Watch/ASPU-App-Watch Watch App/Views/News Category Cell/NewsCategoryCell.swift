//
//  NewsCategoryCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct NewsCategoryCell: View {
    
    var category: NewsCategoryModel
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            NavigationLink {
                CurrentCategoryNewsListView(category: category)
            } label: {
                HStack {
                    Text(category.name)
                        .fontWeight(.bold)
                    Spacer()
                    Image("check")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        } else {
            NavigationLink {
                CurrentCategoryNewsListView(category: category)
            } label: {
                HStack {
                    Text(category.name)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    NewsCategoryCell(category: NewsCategories.categories[0], isSelected: true)
}
