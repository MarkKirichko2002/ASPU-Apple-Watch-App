//
//  FacultiesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class FacultiesListViewModel: ObservableObject {
    
    @Published var faculties = [FacultyModel]()
    @Published var currentFaculty = FacultyModel(facultyName: "", groups: [])
    @Published var isPresented = false
    @Published var isSelected = false
    @Published var isLoading = true
    
    // MARK: - сервисы
    private let service = TimeTableService()
    
    func getFaculties() {
        isLoading = true
        service.getGroups { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.faculties = data
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print(error)
            }
        }
    }
}
