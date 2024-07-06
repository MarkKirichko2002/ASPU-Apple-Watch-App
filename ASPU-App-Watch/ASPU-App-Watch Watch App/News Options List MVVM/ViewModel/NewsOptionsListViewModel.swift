//
//  NewsOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

class NewsOptionsListViewModel: ObservableObject {
    
    @Published var options = NewsOptions.options
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func getData() {
        let savedCategory = settingsManager.getSavedCategory()
        guard let category = NewsCategories.categories.first (where: { $0.abbreviation == savedCategory}) else {return}
        options[0].name = "Категория: \(category.name)"
    }
}
