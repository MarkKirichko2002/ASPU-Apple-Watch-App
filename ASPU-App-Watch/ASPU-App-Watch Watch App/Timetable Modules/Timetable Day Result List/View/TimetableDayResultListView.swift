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
            if !viewModel.timetable.disciplines.isEmpty {
                List(viewModel.timetable.disciplines, id: \.time) { pair in
                    PairCell(discipline: pair)
                }.listStyle(.carousel)
            } else {
                Text("Нет расписания")
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
