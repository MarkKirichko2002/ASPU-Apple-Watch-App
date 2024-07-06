//
//  NewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel = NewsListViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.newsResponse.articles ?? []) { article in
                ArticleCell(article: article)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.viewModel.isPresented.toggle()
                    }) {
                        Image("sections")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isPresented) {
                NewsOptionsListView()
            }
            .listStyle(.carousel)
        }
    }
}

#Preview {
    NewsListView()
}
