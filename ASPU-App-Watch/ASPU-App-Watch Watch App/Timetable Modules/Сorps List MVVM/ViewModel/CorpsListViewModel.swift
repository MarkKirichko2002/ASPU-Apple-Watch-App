//
//  CorpsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

final class CorpsListViewModel: ObservableObject {
    
    var corps = Buildings.pins
    @Published var isPresented = false
    @Published var isInfoSelected = false
    @Published var isInfoPresented = false
    @Published var currentBuilding = Buildings.pins[0]
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func checkSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func getSwipeEdge()-> swipeEdges {
        return settingsManager.getSavedSwipeEdge()
    }
}
