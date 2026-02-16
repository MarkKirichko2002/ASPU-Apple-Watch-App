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
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else {
                List(viewModel.faculties) { faculty in
                    if viewModel.checkSwipeOption() {
                        HStack {
                            Text(faculty.facultyName)
                                .fontWeight(.bold)
                        }.onTapGesture {
                            viewModel.currentFaculty = faculty
                            viewModel.isSelected.toggle()
                        }.swipeActions(edge: viewModel.getSwipeEdge().edge) {
                            Button {
                                viewModel.currentFaculty = faculty
                                viewModel.isInfoSelected.toggle()
                           } label: {
                               Image("info")
                           }
                        }
                    } else {
                        HStack {
                            Text(faculty.facultyName)
                                .fontWeight(.bold)
                        }.onTapGesture {
                            viewModel.currentFaculty = faculty
                            viewModel.isSelected.toggle()
                        }
                    }
                }
            }
        }.modifier(CustomListStyle())
        .navigationTitle("Факультеты")
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .onChange(of: viewModel.isInfoSelected) {
            viewModel.isInfoPresented.toggle()
        }
        .onAppear {
            viewModel.getFaculties()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            FacultyGroupsListView(faculty: viewModel.currentFaculty)
        })
        .sheet(isPresented: $viewModel.isInfoPresented, content: {
            FacultyGroupsInfoView(faculty: viewModel.currentFaculty)
        })
    }
}

#Preview {
    FacultiesListView()
}
