//
//  NewsGroupDateFilterListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.06.2025.
//

import SwiftUI

struct NewsGroupDateFilterListView: View {
    
    @ObservedObject var viewModel = NewsGroupDateFilterListViewModel()
    var articles: [Article]
    var abbreviation: String
    
    var body: some View {
        VStack {
            if viewModel.sections.isEmpty {
                Text("Нет новостей")
                    .fontWeight(.bold)
            } else {
                List(viewModel.sections, id: \.date) { section in
                    NewsDateSectionCell(section: section)
                }.modifier(CustomListStyle())
            }
        }
        .navigationTitle(viewModel.currentCategory.name)
        .onAppear {
            viewModel.setUpDate(articles: articles, abbreviation: abbreviation)
        }
    }
}

//#Preview {
//    NewsGroupDateFilterListView()
//}
