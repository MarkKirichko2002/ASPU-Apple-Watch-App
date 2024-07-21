//
//  CurrentCategoryNewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct CurrentCategoryNewsListView: View {
    
    @ObservedObject var viewModel = CurrentCategoryNewsListViewModel()
    var category: NewsCategoryModel
    
    var body: some View {
        List(viewModel.newsResponse.articles ?? []) { article in
            ArticleCell(article: article, abbreviation: category.abbreviation)
        }
        .listStyle(.carousel)
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getNews(category: category)
        }
    }
}

//#Preview {
//    CurrentCategoryNewsListView(category: NewsCategories.categories[0])
//}
