//
//  NewsCategoriesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
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
        .navigationTitle("Категории")
    }
}

#Preview {
    NewsCategoriesListView()
}
