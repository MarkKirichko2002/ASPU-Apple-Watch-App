//
//  SettingsManager.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

class SettingsManager {
    
    func saveCategory(abbreviation: String) {
        UserDefaults.standard.setValue(abbreviation, forKey: "news category")
    }
    
    func getSavedCategory()-> String {
        let savedCategory = UserDefaults.standard.object(forKey: "news category") as? String ?? ""
        return savedCategory
    }
}
