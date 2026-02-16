//
//  NewsCellLetterCaseOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.05.2025.
//

import Foundation

final class NewsCellLetterCaseOptionsListViewModel: ObservableObject {
    
    var cases = LetterCases.allCases
    @Published var isChanged = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func selectLetterCase(letterCase: LetterCases) {
        settingsManager.saveLetterCase(letterCase: letterCase)
        isChanged.toggle()
    }
    
    func isSavedLetterCase(letterCase: LetterCases)-> Bool {
        let savedLetterCase = settingsManager.getSavedLetterCase()
        return savedLetterCase == letterCase
    }
}
