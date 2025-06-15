//
//  NewsPagesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 20.07.2024.
//

import SwiftUI

struct NewsPagesListView: View {
    
    var count: Int
    var category: NewsCategoryModel
    
    @ObservedObject var viewModel = NewsPagesListViewModel()
    
    var body: some View {
        VStack {
            if count > 0 {
                NavigationView {
                    List(viewModel.pages, id: \.self) { number in
                        NavigationLink {
                            CurrentPageNewsListView(page: number, abbreviation: category.abbreviation)
                        } label: {
                            if viewModel.checkSwipeOption() {
                                Text("Страница \(number)")
                                    .fontWeight(.bold)
                                    .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                                        Button {
                                            viewModel.currentPage = number
                                            viewModel.isInfoSelected.toggle()
                                        } label: {
                                            Image("info")
                                        }
                                  }
                            } else {
                                Text("Страница \(number)")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .navigationTitle(category.name)
                .onChange(of: viewModel.isInfoSelected) {
                    viewModel.isInfoPresented.toggle()
                }
                .sheet(isPresented: $viewModel.isInfoPresented) {
                    NewsCategoryPageNewsCountInfoView(abbreviation: category.abbreviation, page: viewModel.currentPage)
                }
                .onAppear {
                    if viewModel.pages.isEmpty {
                        viewModel.setUpData(count: count)
                    }
                }
            } else {
                Text("Нет страниц")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NewsPagesListView(count: 46, category: NewsCategories.categories[0])
}
