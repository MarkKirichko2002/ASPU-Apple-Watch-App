//
//  CurrentPageNewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.07.2024.
//

import SwiftUI

struct CurrentPageNewsListView: View {
    
    @ObservedObject var viewModel = CurrentPageNewsListViewModel()
    var page: Int
    var category: NewsCategoryModel
    
    var body: some View {
        List(viewModel.articles) { article in
            ArticleCell(article: article, abbreviation: category.abbreviation)
        }
        .listStyle(.carousel)
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getNews(page: page, abbreviation: category.abbreviation)
        }
    }
}

#Preview {
    CurrentPageNewsListView(page: 1, category: NewsCategories.categories[0])
}
