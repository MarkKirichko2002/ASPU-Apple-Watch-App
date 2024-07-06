//
//  SavedNewsCategoriesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

final class SavedNewsCategoriesListViewModel: ObservableObject {
    
    var categories = NewsCategories.categories
    @Published var isChanged = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func selectCategory(category: NewsCategoryModel) {
        settingsManager.saveCategory(abbreviation: category.abbreviation)
        isChanged.toggle()
    }
    
    func isSavedCategory(category: NewsCategoryModel)-> Bool {
        let savedCategory = settingsManager.getSavedCategory()
        if savedCategory == category.abbreviation {
            return true
        }
        return false
    }
}
