//
//  FacultyGroupsInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2025.
//

import Foundation

final class FacultyGroupsInfoViewModel: ObservableObject {
    
    @Published var text = ""
    @Published var isPresented = false
    
    func getGroupsInfo(faculty: FacultyModel) {
        let groups = faculty.groups
        text = "Всего групп: \(groups.count)"
    }
}
