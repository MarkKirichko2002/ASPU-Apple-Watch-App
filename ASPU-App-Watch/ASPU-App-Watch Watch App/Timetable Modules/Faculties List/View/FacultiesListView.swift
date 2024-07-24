//
//  FacultiesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultiesListView: View {
    
    @State var currentFaculty = FacultyGroups.groups[0]
    @State var isPresented = false
    @State var isSelected = false
    
    var body: some View {
        List(FacultyGroups.groups) { faculty in
            Text(faculty.facultyName)
                .onTapGesture {
                    currentFaculty = faculty
                    isSelected.toggle()
             }
        }
        .navigationTitle("Факультеты")
        .listStyle(.carousel)
        .onChange(of: isSelected) {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: {
            FacultyGroupsListView(faculty: currentFaculty)
        })
    }
}

#Preview {
    FacultiesListView()
}
