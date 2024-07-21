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
        
        NavigationView {
            List(viewModel.categories) { category in
                NewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
            }
            .onAppear {
                viewModel.updateView()
            }
            .navigationTitle("Категории")
        }
    }
}

#Preview {
    NewsCategoriesListView()
}
