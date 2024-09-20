//
//  TodayNewsInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.09.2024.
//

import SwiftUI

struct TodayNewsInfoView: View {
    
    @ObservedObject var viewModel = TodayNewsInfoViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    Text("Загрузка...")
                        .fontWeight(.bold)
                } else if viewModel.sections.isEmpty {
                    Text("Нет новостей")
                        .fontWeight(.bold)
                } else {
                    List(viewModel.sections, id: \.name) { section in
                        TodayNewsCategoryCell(section: section)
                    }.modifier(CustomListStyle())
                }
            }
            .navigationTitle(viewModel.title)
        }
    }
}

#Preview {
    TodayNewsInfoView()
}
