//
//  CurrentCategoryNewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct CurrentCategoryNewsListView: View {
    
    @ObservedObject var viewModel = CurrentCategoryNewsListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.newsResponse.articles ?? []) { article in
                ArticleCell(article: article)
            }
            .listStyle(.carousel)
        }
    }
}

#Preview {
    CurrentCategoryNewsListView()
}
