//
//  TeachersListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

class TeachersListViewModel: ObservableObject {
    
    @Published var teachers = [TeacherModel]()
    @Published var isPresented = false
    @Published var currentTeacher = ""
    
    // MARK: - сервисы
    private let dbService = DBService(response: .teachers)
    
    init() {
        print("fknnkf")
    }
    
    func getData(id: Int) {
        
        dbService.id = id
        
        print(id)
        
        DispatchQueue.global().async {
            self.dbService.getData()
        }
        DispatchQueue.main.async {
            self.dbService.getTeachers { teachers in
                self.teachers = teachers.compactMap({TeacherModel(id: $0.id ?? 0, firstName: $0.firstName, lastName: $0.lastName, fatherName: $0.fatherName ?? "") })
            }
        }
    }
    
    func configure(teacher: TeacherModel)-> String {
        let result = "\(teacher.lastName) \(teacher.firstName) \(teacher.fatherName)"
        return result.abbreviation()
    }
}
