//
//  PairFilterTypeListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import SwiftUI

struct PairFilterTypeListView: View {
    
    var date: String
    var disciplines: [Discipline]
    
    @ObservedObject var viewModel = PairFilterTypeListViewModel()
    
    var body: some View {
        List(viewModel.types, id: \.id) { type in
            NavigationLink {
                PairTypeView(date: date, type: type.type, disciplines: viewModel.filterDisciplines(type: type.type))
            } label: {
                Text("\(type.name) (\(type.count))")
                    .fontWeight(.bold)
            }
        }.navigationTitle("Фильтрация")
            .onAppear {
                if !viewModel.isFiltered {
                    viewModel.setUpData(date: date, disciplines: disciplines)
                }
         }
    }
}

#Preview {
    PairFilterTypeListView(date: "", disciplines: [])
}
