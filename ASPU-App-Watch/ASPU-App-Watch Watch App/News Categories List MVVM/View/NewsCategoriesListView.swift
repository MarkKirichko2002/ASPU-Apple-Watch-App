//
//  NewsCategoriesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct NewsCategoriesListView: View {
    
    @ObservedObject var viewModel = NewsCategoriesListViewModel()
    
    var body: some View {
        List(viewModel.categories) { category in
            NewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
                .onTapGesture {
                    viewModel.selectCategory(category: category)
             }
        }
        .onChange(of: viewModel.isChanged) {}
        .sheet(isPresented: $viewModel.isChanged) {
            CurrentCategoryNewsListView(category: viewModel.currentCategory)
        }
        .navigationTitle("Категории")
    }
}

#Preview {
    NewsCategoriesListView()
}
