//
//  NewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel = NewsListViewModel()
    @State var isDisappear = false
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else {
                List(viewModel.newsResponse.articles ?? []) { article in
                    ArticleCell(article: article, abbreviation: viewModel.currentCategory.abbreviation, isSavedArticle: false)
                }.modifier(CustomListStyle())
            }
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
        .onAppear {
            if viewModel.isLoading {
                viewModel.getNews()
            }
        }
        .onChange(of: isDisappear) {
            viewModel.getNews()
        }
        .sheet(isPresented: $viewModel.isPresented) {
            NewsOptionsListView()
        }
    }
}

#Preview {
    NewsListView()
}
