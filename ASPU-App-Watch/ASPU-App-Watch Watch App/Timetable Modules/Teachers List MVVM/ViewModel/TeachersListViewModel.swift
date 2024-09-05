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
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    private let dateManager = DateManager()
    
    func getData(id: Int) {
        teachers = Departments.departments[id - 1].teachers
    }
    
    func configure(teacher: String)-> String {
        return teacher.abbreviation()
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
    
    func isSavedTeacher(teacher: String)-> Bool {
        let savedTeacher = settingsManager.getSavedID()
        if savedTeacher == teacher {
            return true
        }
        return false
    }
}
