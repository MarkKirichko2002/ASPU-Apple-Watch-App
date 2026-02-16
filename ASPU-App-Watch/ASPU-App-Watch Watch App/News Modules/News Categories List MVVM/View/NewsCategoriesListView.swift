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
                if viewModel.checkSwipeOption() {
                    NewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
                        .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                            Button {
                                viewModel.currentCategory = category
                                viewModel.isInfoSelected.toggle()
                            } label: {
                                Image("info")
                            }
                        }
                } else {
                    NewsCategoryCell(category: category, isSelected: viewModel.isSavedCategory(category: category))
                }
            }
            .onChange(of: viewModel.isInfoSelected) {
                viewModel.isInfoPresented.toggle()
            }
            .sheet(isPresented: $viewModel.isInfoPresented) {
                NewsCategoryPagesCountInfoView(category: viewModel.currentCategory)
            }
            .onAppear {
                viewModel.updateView()
            }
            .navigationTitle("Категории")
        }
    }
}

//#Preview {
//    NewsCategoriesListView()
//}
