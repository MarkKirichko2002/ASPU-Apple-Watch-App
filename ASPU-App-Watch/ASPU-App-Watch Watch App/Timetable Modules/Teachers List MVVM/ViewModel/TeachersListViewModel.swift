//
//  TeachersListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

final class TeachersListViewModel: ObservableObject {
    
    @Published var teachers = Departments.departments[0].teachers
    @Published var isPresented = false
    @Published var currentTeacher = ""
    
    func getData(id: Int) {
        teachers = Departments.departments[id - 1].teachers
    }
    
    func configure(teacher: String)-> String {
        return teacher.abbreviation()
    }
}
