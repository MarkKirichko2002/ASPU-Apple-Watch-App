//
//  NewsFilterOptionListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import SwiftUI

struct NewsFilterOptionListView: View {
    
    @ObservedObject var viewModel = NewsFilterOptionListViewModel()
    var news: [Article]
    var abbreviation: String
    
    var body: some View {
        NavigationView {
            List(viewModel.options) { option in
                NavigationLink {
                    NewsFilterOptionView(articles: viewModel.filterNews(option: option.option), abbreviation: abbreviation)
                } label: {
                    Text("\(option.name) (\(option.count))")
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Фильтрация")
            .onAppear {
                viewModel.getInfo(articles: news)
            }
        }
    }
}

#Preview {
    NewsFilterOptionListView(news: [], abbreviation: "-")
}
