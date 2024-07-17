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
            if !viewModel.timetable.disciplines.isEmpty {
                List(viewModel.timetable.disciplines) { pair in
                    PairCell(discipline: pair)
                }.listStyle(.carousel)
            } else {
                Text("Нет расписания")
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
            TeachersListView(id: 1)
        }
        .navigationTitle(viewModel.getCurrentDate())
    }
}

#Preview {
    TimetableDayListView()
}
