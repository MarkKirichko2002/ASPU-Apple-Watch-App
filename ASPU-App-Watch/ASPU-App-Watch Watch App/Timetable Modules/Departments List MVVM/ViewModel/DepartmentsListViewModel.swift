//
//  DepartmentsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

class DepartmentsListViewModel: ObservableObject {
    
    @Published var departments = [DepartmentModel]()
    
    // MARK: - сервисы
    private let dbService = DBService(response: .departments)
    
    init() {
        getData()
    }
    
    private func getData() {
        DispatchQueue.global().async {
            self.dbService.getData()
        }
        DispatchQueue.main.async {
            self.dbService.getDepartments { departments in
                self.departments = departments.compactMap({ DepartmentModel(id: $0.id ?? 0, name: $0.name) })
            }
        }
    }
}
