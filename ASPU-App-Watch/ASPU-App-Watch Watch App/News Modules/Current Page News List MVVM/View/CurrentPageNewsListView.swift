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
    var abbreviation: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.articles.isEmpty {
                Text("Нет новостей")
                    .fontWeight(.bold)
            } else {
                List(viewModel.articles) { article in
                    ArticleCell(article: article, abbreviation: viewModel.abbreviation, isSavedArticle: false)
                }.listStyle(.carousel)
            }
        }
        .navigationTitle("Страница: \(page)")
        .onAppear {
            if viewModel.isLoading {
                viewModel.getNews(page: page, abbreviation: abbreviation)
            }
        }
    }
}

#Preview {
    CurrentPageNewsListView(page: 0, abbreviation: "")
}
