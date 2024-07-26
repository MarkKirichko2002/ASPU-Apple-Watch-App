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
        List(viewModel.weeks) { week in
            WeekCell(week: week)
        }
        .navigationTitle("Недели")
        .onAppear() {
            viewModel.getWeeks()
        }
    }
}

#Preview {
    WeeksListView()
}
