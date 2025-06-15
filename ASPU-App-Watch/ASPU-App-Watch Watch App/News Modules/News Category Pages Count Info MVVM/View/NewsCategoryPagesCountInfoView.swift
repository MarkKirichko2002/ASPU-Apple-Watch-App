//
//  NewsCategoryPagesCountInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.05.2025.
//

import SwiftUI

struct NewsCategoryPagesCountInfoView: View {
    
    @ObservedObject var viewModel = NewsCategoryPagesCountInfoViewModel()
    var category: NewsCategoryModel
    
    var body: some View {
        VStack(spacing: 25) {
            Image("mail")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    viewModel.isPresented.toggle()
                }
            Text(viewModel.info)
                .fontWeight(.bold)
                .onTapGesture {
                    viewModel.isPresented.toggle()
             }
        }.navigationTitle(category.name)
        .onAppear {
            viewModel.getNewsCategoryInfo(category: category)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            NewsPagesListView(count: viewModel.newsResponse.countPages ?? 0, category: category)
        }
    }
}

//#Preview {
//    NewsCategoryPagesCountInfoView()
//}
