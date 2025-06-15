//
//  NewsCategoryPageNewsCountInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.05.2025.
//

import SwiftUI

struct NewsCategoryPageNewsCountInfoView: View {
    
    @ObservedObject var viewModel = NewsCategoryPageNewsCountInfoViewModel()
    var abbreviation: String
    var page: Int
    
    var body: some View {
        VStack(spacing: 25) {
            Image("hashtag")
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
        }.navigationTitle("Страница \(page)")
        .onAppear {
            viewModel.getNewsCategoryPageInfo(page: page, abbreviation: abbreviation)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            NavigationView {
                CurrentPageNewsListView(page: page, abbreviation: abbreviation)
            }
        }
    }
}

//#Preview {
//    NewsCategoryPageNewsCountInfoView()
//}
