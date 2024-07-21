//
//  TimetableOwnersListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.07.2024.
//

import Foundation

final class TimetableOwnersListViewModel: ObservableObject {
    
    @Published var isChanged = false
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func getID()-> String {
        return settingsManager.getSavedID()
    }
    
    func getOwner()-> String {
        return settingsManager.getSavedOwner()
    }
    
    func updateView() {
        isChanged.toggle()
    }
}
