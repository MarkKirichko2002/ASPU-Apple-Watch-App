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
            if viewModel.checkSwipeOption() {
                HStack {
                    Text(department.name)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    self.viewModel.isPresented.toggle()
                    self.viewModel.currentId = department.id
                 }
                .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                     Button {
                        self.viewModel.isInfoPresented.toggle()
                        self.viewModel.currentId = department.id
                    } label: {
                        Image("info")
                    }
                 }
            } else {
                HStack {
                    Text(department.name)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                    .onTapGesture {
                        self.viewModel.isPresented.toggle()
                        self.viewModel.currentId = department.id
                }
            }
        }.modifier(CustomListStyle())
        .navigationTitle("Кафедры")
        .sheet(isPresented: $viewModel.isPresented) {
            TeachersListView(id: viewModel.currentId)
        }
        .sheet(isPresented: $viewModel.isInfoPresented) {
            DepartmentInfoView(id: viewModel.currentId)
        }
    }
}

#Preview {
    DepartmentsListView()
}
