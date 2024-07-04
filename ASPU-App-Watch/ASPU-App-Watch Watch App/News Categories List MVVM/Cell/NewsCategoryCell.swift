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
            HStack {
                Image("aspu")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(category.name)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Image("aspu")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(category.name)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NewsCategoryCell(category: NewsCategories.categories[0], isSelected: true)
}
