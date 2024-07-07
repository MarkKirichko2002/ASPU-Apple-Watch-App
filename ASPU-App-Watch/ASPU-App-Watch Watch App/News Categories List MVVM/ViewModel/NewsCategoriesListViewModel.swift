//
//  NewsCategoriesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class NewsCategoriesListViewModel: ObservableObject {
    
    @Published var isChanged = false
    var categories = NewsCategories.categories
    var currentCategory = NewsCategories.categories[0]
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func selectCategory(category: NewsCategoryModel) {
        currentCategory = category
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

