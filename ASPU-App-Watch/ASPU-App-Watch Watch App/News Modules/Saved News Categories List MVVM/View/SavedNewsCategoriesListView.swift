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
            if viewModel.isSavedCategory(category: category) {
                SavedNewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
            } else {
                SavedNewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
                    .onTapGesture {
                        viewModel.selectCategory(category: category)
                        closeScreen()
                    }
              }
        }
        .navigationTitle("Категории")
        .onChange(of: viewModel.isChanged) {}
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    SavedNewsCategoriesListView()
}
