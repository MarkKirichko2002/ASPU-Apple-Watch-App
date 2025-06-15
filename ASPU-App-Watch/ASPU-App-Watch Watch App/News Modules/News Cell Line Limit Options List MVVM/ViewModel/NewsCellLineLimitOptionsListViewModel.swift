//
//  NewsCellLineLimitOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.05.2025.
//

import Foundation

final class NewsCellLineLimitOptionsListViewModel: ObservableObject {
    
    var limits = LineLimits.allCases
    @Published var isChanged = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func selectLineLimit(limit: LineLimits) {
        settingsManager.saveLineLimit(limit: limit)
        isChanged.toggle()
    }
    
    func isSavedLineLimit(limit: LineLimits)-> Bool {
        let savedLineLimit = settingsManager.getSavedLineLimit()
        return savedLineLimit == limit
    }
}
