//
//  NewsFilterOptionView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import SwiftUI

struct NewsFilterOptionView: View {
    
    @ObservedObject var viewModel = NewsFilterOptionViewModel()
    var articles: [Article]
    var abbreviation: String
    
    var body: some View {
        VStack {
            if viewModel.articles.isEmpty {
                Text("Нет новостей")
                    .fontWeight(.bold)
            } else {
                List(viewModel.articles) { article in
                    ArticleCell(article: article, abbreviation: abbreviation, isSavedArticle: false)
                }
            }
        }.onAppear {
            viewModel.setUpData(articles: articles)
         }
        .navigationTitle("Новости: \(viewModel.articles.count)")
    }
}

#Preview {
    NewsFilterOptionView(articles: [], abbreviation: "-")
}
