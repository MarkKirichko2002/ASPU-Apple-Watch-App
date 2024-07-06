//
//  NewsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI

struct NewsOptionsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = NewsOptionsListViewModel()
    
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
            viewModel.getData()
        }
        .navigationTitle("Новости")
    }
}

#Preview {
    NewsOptionsListView()
}
