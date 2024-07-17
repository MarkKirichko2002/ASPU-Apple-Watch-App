//
//  TeachersListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct TeachersListView: View {
    
    @ObservedObject var viewModel = TeachersListViewModel()
    var id: Int
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.teachers.isEmpty {
                    List(viewModel.teachers) { teacher in
                        Text(viewModel.configure(teacher: teacher))
                            .onTapGesture {
                                viewModel.isPresented.toggle()
                                viewModel.currentTeacher = viewModel.configure(teacher: teacher)
                            }
                    }
                } else {
                    Text("Загрузка...")
                }
            }
            .navigationTitle("Препод.")
            .onAppear {
                viewModel.getData(id: id)
            }
            .sheet(isPresented: $viewModel.isPresented, content: {
                TimetableDayResultListView(id: viewModel.currentTeacher, owner: "TEACHER")
            })
        }
    }
}

#Preview {
    TeachersListView(id: 1)
}
