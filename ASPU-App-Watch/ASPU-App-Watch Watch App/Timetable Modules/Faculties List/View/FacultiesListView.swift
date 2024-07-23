//
//  FacultiesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultiesListView: View {
    
    @State var isPresented = false
    @State var currentFaculty = FacultyGroups.groups[0]
    
    var body: some View {
        List(FacultyGroups.groups) { faculty in
            Text(faculty.facultyName)
                .onTapGesture {
                    currentFaculty = faculty
             }
        }
        .navigationTitle("Факультеты")
        .onChange(of: currentFaculty.facultyName) {
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
