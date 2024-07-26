//
//  TimetableDayListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import SwiftUI

struct TimetableDayListView: View {
    
    @ObservedObject var viewModel = TimetableDayListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.timetable.disciplines.isEmpty {
                Text("Нет пар")
                    .fontWeight(.bold)
            } else {
                List(viewModel.timetable.disciplines) { pair in
                    PairCell(discipline: pair)
                }.listStyle(.carousel)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.isPresented.toggle()
                }) {
                    Image("sections")
                }
            }
        }
        .onAppear {
            viewModel.getTimetable()
        }
        .sheet(isPresented: $viewModel.isPresented) {
            TimetableOwnersListView()
        }
        .navigationTitle(viewModel.getCurrentDate())
    }
}

#Preview {
    TimetableDayListView()
}
