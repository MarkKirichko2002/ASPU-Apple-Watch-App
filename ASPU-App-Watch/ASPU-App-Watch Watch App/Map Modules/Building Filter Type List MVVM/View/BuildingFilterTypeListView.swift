//
//  BuildingFilterTypeListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 08.08.2024.
//

import SwiftUI

struct BuildingFilterTypeListView: View {
    
    @ObservedObject var viewModel = BuildingFilterTypeListViewModel()
    var buildings: [BuildingModel]
    
    var body: some View {
        NavigationView {
            List(viewModel.types) { type in
                NavigationLink {
                    BuildingTypeView(buildings: viewModel.filterBuildings(type: type))
                } label: {
                    Text("\(type.name) (\(type.count))")
                }
            }
            .navigationTitle("Фильтрация")
            .onAppear {
                viewModel.getInfo(buildings: buildings)
            }
        }
    }
}

#Preview {
    BuildingFilterTypeListView(buildings: [])
}
