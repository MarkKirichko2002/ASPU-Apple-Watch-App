//
//  TimetableDayTimeInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 28.04.2025.
//

import SwiftUI

struct TimetableDayTimeInfoView: View {
    
    @ObservedObject var viewModel = TimetableDayTimeInfoViewModel()
    var id: String
    var date: String
    var owner: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else {
                List(viewModel.info, id: \.self) { item in
                    Text(item)
                        .fontWeight(.bold)
                    
                }
            }
        }.navigationTitle(date)
        .onAppear {
            viewModel.getTimetable(id: id, date: date, owner: owner)
        }
    }
}

//#Preview {
//    TimetableDayTimeInfoView()
//}
