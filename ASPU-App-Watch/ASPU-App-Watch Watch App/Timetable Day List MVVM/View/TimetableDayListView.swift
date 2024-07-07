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
        .onAppear {
            viewModel.getTimetable()
        }
        .navigationTitle(viewModel.getCurrentDate())
    }
}

#Preview {
    TimetableDayListView()
}
