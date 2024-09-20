//
//  AudiencesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class AudiencesListViewModel: ObservableObject {
    
    @Published var currentAudience = ""
    @Published var isPresented = false
    @Published var isSelected = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    private let dateManager = DateManager()
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
    
    func isSavedAudience(audience: String)-> Bool {
        let savedAudience = settingsManager.getSavedID()
        if savedAudience == audience {
            return true
        }
        return false
    }
    
}
