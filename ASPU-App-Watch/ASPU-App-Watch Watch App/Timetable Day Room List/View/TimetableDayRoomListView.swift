//
//  TimetableDayRoomListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import SwiftUI

struct TimetableDayRoomListView: View {
    
    @ObservedObject var viewModel = TimetableDayRoomListViewModel()
    var room: String = ""
    
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
            viewModel.getTimetable(room: room)
        }
        .navigationTitle(room)
    }
}

#Preview {
    TimetableDayRoomListView()
}
