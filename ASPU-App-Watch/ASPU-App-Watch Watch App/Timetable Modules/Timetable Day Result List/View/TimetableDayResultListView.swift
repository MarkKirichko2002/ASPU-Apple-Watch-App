//
//  TimetableDayResultListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import SwiftUI

struct TimetableDayResultListView: View {
    
    @ObservedObject var viewModel = TimetableDayResultListViewModel()
    var id: String = ""
    var date: String = ""
    var owner: String = ""
    
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
        .onAppear {
            viewModel.getTimetable(id: id, date: date, owner: owner)
        }
        .navigationTitle(id)
    }
}

#Preview {
    TimetableDayResultListView(id: "ВМ-ИВТ-2-1", owner: "GROUP")
}
