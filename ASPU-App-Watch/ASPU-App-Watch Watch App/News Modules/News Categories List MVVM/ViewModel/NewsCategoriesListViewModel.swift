//
//  NewsCategoriesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class NewsCategoriesListViewModel: ObservableObject {
    
    @Published var currentCategory = NewsCategories.categories[0]
    @Published var isChanged = false
    var categories = NewsCategories.categories
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func updateView() {
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
            self.isChanged.toggle()
        }
    }
    
    func isSavedCategory(category: NewsCategoryModel)-> Bool {
        let savedCategory = settingsManager.getSavedCategory()
        if savedCategory == category.abbreviation {
            return true
        }
        return false
    }
}
