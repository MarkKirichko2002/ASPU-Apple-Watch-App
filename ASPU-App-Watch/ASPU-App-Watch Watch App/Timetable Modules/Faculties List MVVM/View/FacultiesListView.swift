//
//  FacultiesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultiesListView: View {
    
    @ObservedObject var viewModel = FacultiesListViewModel()
    
    var body: some View {
        List(viewModel.faculties) { faculty in
            Text(faculty.facultyName)
                .onTapGesture {
                    viewModel.currentFaculty = faculty
                    viewModel.isSelected.toggle()
             }
        }
        .navigationTitle("Факультеты")
        .listStyle(.carousel)
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .onAppear {
            viewModel.getFaculties()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            FacultyGroupsListView(faculty: viewModel.currentFaculty)
        })
    }
}

#Preview {
    FacultiesListView()
}
