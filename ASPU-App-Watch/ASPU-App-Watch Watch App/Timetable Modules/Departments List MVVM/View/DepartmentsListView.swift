//
//  DepartmentsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct DepartmentsListView: View {
    
    @ObservedObject var viewModel = DepartmentsListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.departments.isEmpty {
                    List(viewModel.departments) { department in
                        NavigationLink {
                            TeachersListView(id: department.id)
                        } label: {
                            Text(department.name)
                        }
                    }
                    .listStyle(.carousel)
                } else {
                    Text("Загрузка...")
                }
            }
            .navigationTitle("Кафедры")
        }
    }
}

#Preview {
    DepartmentsListView()
}
