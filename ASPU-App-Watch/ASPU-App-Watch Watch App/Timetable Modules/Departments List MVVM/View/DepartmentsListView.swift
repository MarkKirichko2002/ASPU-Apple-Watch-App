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
        VStack {
            if !viewModel.departments.isEmpty {
                List(viewModel.departments) { department in
                    Text(department.name)
                        .onTapGesture {
                            self.viewModel.isPresented.toggle()
                            self.viewModel.currentId = department.id
                        }
                }
                .listStyle(.carousel)
            } else {
                Text("Загрузка...")
            }
        }
        .sheet(isPresented: $viewModel.isPresented) {
            TeachersListView(id: viewModel.currentId)
        }
        .navigationTitle("Кафедры")
    }
}

#Preview {
    DepartmentsListView()
}
