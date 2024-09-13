//
//  TodayNewsCategoryCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.09.2024.
//

import SwiftUI

struct TodayNewsCategoryCell: View {
    
    var section: TodayNewsSectionModel
    
    var body: some View {
        NavigationLink {
            FillNewsListView(abbreviation: section.abbreviation, articles: section.news)
        } label: {
            HStack {
                Text(section.name)
                    .fontWeight(.bold)
            }
        }
    }
}

//#Preview {
//    NewsCategoryCell(category: NewsCategories.categories[0], isSelected: true)
//}
