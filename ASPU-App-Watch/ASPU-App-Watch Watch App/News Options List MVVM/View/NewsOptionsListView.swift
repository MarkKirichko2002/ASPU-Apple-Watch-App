//
//  NewsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct NewsOptionsListView: View {
    
    @ObservedObject var viewModel = NewsOptionsListViewModel()
    @Binding var isDisappear: Bool
    
    var category: NewsCategoryModel
    
    var body: some View {
        NavigationView {
            List(viewModel.options) { option in
                NavigationLink {
                    switch option.id {
                    case 1:
                        NewsCategoriesListView()
                    default:
                        EmptyView()
                    }
                } label: {
                    Text(option.name)
                }
            }
        }
        .onAppear {
            viewModel.getData(category: category)
        }
        .onDisappear {
            isDisappear.toggle()
        }
        .navigationTitle("Новости")
    }
}

//#Preview {
//    NewsOptionsListView(category: NewsCategories.categories[0])
//}
