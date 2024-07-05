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
        List(viewModel.timetable.disciplines) { pair in
            PairCell(discipline: pair)
        }.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                   
                } label: {
                    Image("sections")
                }
            }
        }
        .listStyle(.carousel)
            .navigationTitle("05.07.2024")
        .onChange(of: viewModel.isChanged) {}
    }
}

#Preview {
    TimetableDayListView()
}
