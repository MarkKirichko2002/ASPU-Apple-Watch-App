//
//  FacultyGroupsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultyGroupsListView: View {
    
    @ObservedObject var viewModel = FacultyGroupsListViewModel()
    var faculty: FacultyModel
    
    var body: some View {
        List(faculty.groups, id: \.self) { group in
            GroupCell(group: group, isSelected: viewModel.isSavedGroup(group: group))
                .onTapGesture {
                    viewModel.currentGroup = group
                    viewModel.isSelected.toggle()
              }
        }
        .navigationTitle("Группы")
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            TimetableDayResultListView(id: viewModel.currentGroup, date: viewModel.getCurrentDate(), owner: "GROUP")
        })
    }
}

//#Preview {
//    FacultyGroupsListView(faculty: FacultyGroups.groups[0])
//}
