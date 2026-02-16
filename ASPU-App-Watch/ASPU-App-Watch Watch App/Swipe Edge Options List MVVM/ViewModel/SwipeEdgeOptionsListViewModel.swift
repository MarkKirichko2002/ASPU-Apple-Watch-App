//
//  SwipeEdgeOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.05.2025.
//

import Foundation

final class SwipeEdgeOptionsListViewModel: ObservableObject {
    
    var edges = swipeEdges.allCases
    @Published var isChanged = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func selectSwipeEdge(edge: swipeEdges) {
        settingsManager.saveSwipeEdge(edge: edge)
        isChanged.toggle()
    }
    
    func isSavedSwipeEdge(edge: swipeEdges)-> Bool {
        let savedSwipeEdge = settingsManager.getSavedSwipeEdge()
        return savedSwipeEdge == edge
    }
}
