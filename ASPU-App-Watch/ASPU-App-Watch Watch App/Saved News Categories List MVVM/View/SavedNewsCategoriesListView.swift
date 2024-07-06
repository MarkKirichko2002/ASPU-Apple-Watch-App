//
//  SavedNewsCategoriesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct SavedNewsCategoriesListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = SavedNewsCategoriesListViewModel()
    
    var body: some View {
        List(viewModel.categories) { category in
            NewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                    viewModel.selectCategory(category: category)
             }
        }
        .onChange(of: viewModel.isChanged) {}
        .navigationTitle("Категории")
    }
}

#Preview {
    SavedNewsCategoriesListView()
}
