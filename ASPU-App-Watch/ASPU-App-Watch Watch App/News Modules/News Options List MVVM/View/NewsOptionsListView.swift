//
//  NewsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct NewsOptionsListView: View {
    
    @ObservedObject var viewModel = NewsOptionsListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.options) { option in
                Text(option.name)
                    .fontWeight(.bold)
                    .onTapGesture {
                        viewModel.currentId = option.id
                        viewModel.isPresented.toggle()
                 }
            }
        }
        .navigationTitle("Новости")
        .sheet(isPresented: $viewModel.isPresented) {
            switch viewModel.currentId {
            case 1: NewsCategoriesListView()
            case 2: NewsPagesListView(count: viewModel.newsResponse.countPages ?? 0, category: viewModel.currentCategory)
            case 3: SavedNewsListView(abbreviation: viewModel.currentCategory.abbreviation)
            default:
                EmptyView()
            }
        }
        .onAppear {
            viewModel.getData()
        }
    }
}

//#Preview {
//    NewsOptionsListView(category: NewsCategories.categories[0])
//}
