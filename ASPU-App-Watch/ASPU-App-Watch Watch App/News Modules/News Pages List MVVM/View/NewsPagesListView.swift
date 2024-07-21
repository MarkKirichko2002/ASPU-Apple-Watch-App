//
//  NewsPagesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 20.07.2024.
//

import SwiftUI

struct NewsPagesListView: View {
    
    var count: Int
    var category: NewsCategoryModel
    
    var body: some View {
        
        VStack {
            if count > 0 {
                NavigationView {
                    List(1...count, id: \.self) { number in
                        NavigationLink {
                            CurrentPageNewsListView(page: number, category: category)
                        } label: {
                            Text("Страница: \(number)")
                        }
                    }
                }
                .navigationTitle(category.name)
            } else {
                Text("Нет страниц")
            }
        }
    }
}

#Preview {
    NewsPagesListView(count: 46, category: NewsCategories.categories[0])
}
