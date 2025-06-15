//
//  DepartmentInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2025.
//

import Foundation

final class DepartmentInfoViewModel: ObservableObject {
    
    @Published var text = ""
    @Published var isPresented = false
    
    func getDepartmentInfo(id: Int) {
        let teachers = Departments.departments[id - 1].teachers
        text = "Всего человек: \(teachers.count)"
    }
}
