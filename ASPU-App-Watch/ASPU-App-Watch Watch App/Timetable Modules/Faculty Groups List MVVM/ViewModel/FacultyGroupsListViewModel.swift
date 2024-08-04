//
//  FacultyGroupsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class FacultyGroupsListViewModel: ObservableObject {
    
    @Published var currentGroup = ""
    @Published var isPresented = false
    @Published var isSelected = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func isSavedGroup(group: String)-> Bool {
        let savedGroup = settingsManager.getSavedID()
        if savedGroup == group {
            return true
        }
        return false
    }
}
