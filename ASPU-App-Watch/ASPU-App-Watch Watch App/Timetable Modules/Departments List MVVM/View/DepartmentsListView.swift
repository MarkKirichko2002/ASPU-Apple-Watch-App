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
        List(viewModel.departments) { department in
            Text(department.name)
                .fontWeight(.bold)
                .onTapGesture {
                    self.viewModel.isPresented.toggle()
                    self.viewModel.currentId = department.id
                }
        }.modifier(CustomListStyle())
        .navigationTitle("Кафедры")
        .sheet(isPresented: $viewModel.isPresented) {
            TeachersListView(id: viewModel.currentId)
        }
    }
}

#Preview {
    DepartmentsListView()
}
