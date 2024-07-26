//
//  WeeksListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct WeeksListView: View {
    
    @ObservedObject var viewModel = WeeksListViewModel()
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.weeks.isEmpty {
                Text("Нет недель")
                    .fontWeight(.bold)
            } else {
                List(viewModel.weeks) { week in
                    WeekCell(week: week)
                        .onTapGesture {
                            viewModel.currentWeek = week
                            viewModel.isSelected.toggle()
                     }
                }.listStyle(.carousel)
            }
        }
        .navigationTitle("Недели")
        .onAppear() {
            viewModel.getWeeks()
        }
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            WeekDaysListView(week: viewModel.currentWeek)
        })
    }
}

#Preview {
    WeeksListView()
}
