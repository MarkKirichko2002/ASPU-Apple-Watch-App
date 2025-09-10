//
//  NewsGroupDateListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct NewsGroupDateListView: View {
    
    @ObservedObject var viewModel: NewsGroupDateListViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.sections.isEmpty {
                Text("Нет новостей")
                    .fontWeight(.bold)
            } else {
                List(viewModel.sections, id: \.date) { section in
                    NewsDateSectionCell(section: section)
                }.modifier(CustomListStyle())
            }
        }
        .navigationTitle(viewModel.currentCategory.name)
        .onAppear {
            if viewModel.isLoading {
                viewModel.getNews()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.viewModel.isPresented.toggle()
                }) {
                    Image("sections")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .sheet(isPresented: $viewModel.isPresented) {
            NewsOptionsListView()
        }
    }
}

//#Preview {
//    NewsGroupDateListView()
//}
