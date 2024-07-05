//
//  NewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct NewsListView: View {
    
    var viewModel = NewsListViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.newsResponse.articles ?? []) { article in
                ArticleCell(article: article)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewsCategoriesListView()
                    } label: {
                        Image("sections")
                    }
                }
            }
            .listStyle(.carousel)
        }
    }
}

#Preview {
    NewsListView()
}
