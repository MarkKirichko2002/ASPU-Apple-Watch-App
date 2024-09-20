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
        List(viewModel.teachers, id: \.self) { teacher in
            TeacherCell(teacher: viewModel.configure(teacher: teacher), isSelected: viewModel.isSavedTeacher(teacher: viewModel.configure(teacher: teacher)))
                .onTapGesture {
                    viewModel.currentTeacher = viewModel.configure(teacher: teacher)
                    viewModel.isPresented.toggle()
             }
        }
        .navigationTitle("Препод.")
        .onAppear {
            viewModel.getData(id: id)
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            TimetableDayResultListView(id: viewModel.currentTeacher, date: viewModel.getCurrentDate(), owner: "TEACHER")
        })
    }
}

#Preview {
    TeachersListView(id: 1)
}
