//
//  SettingsManager.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

final class SettingsManager {
    
    func saveCategory(abbreviation: String) {
        UserDefaults.standard.setValue(abbreviation, forKey: "news category")
    }
    
    func getSavedCategory()-> String {
        let savedCategory = UserDefaults.standard.object(forKey: "news category") as? String ?? "-"
        return savedCategory
    }
    
    func getSavedID()-> String {
        return UserDefaults.standard.object(forKey: "id") as? String ?? "ВМ-ИВТ-3-1"
    }
    
    func getSavedOwner()-> String {
        return UserDefaults.standard.object(forKey: "owner") as? String ?? "GROUP"
    }
    
    func getSplashOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isSplashOn") as? Bool ?? false
    }
    
    func saveSection(index: Int) {
        UserDefaults.standard.set(index, forKey: "section id")
    }
    
    func getSectionId()-> Int {
        return UserDefaults.standard.object(forKey: "section id") as? Int ?? 0
    }
    
    func getRemainingPairsOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    }
    
    func getSwipeOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    }
    
    func getSavedListStyle()-> CellStyle {
        return UserDefaults.loadData(type: CellStyle.self, key: "list style") ?? CellStyle.carousel
    }
    
    func resetAll() {
        UserDefaults.standard.setValue("-", forKey: "news category")
        UserDefaults.standard.setValue("ВМ-ИВТ-3-1", forKey: "id")
        UserDefaults.standard.setValue("GROUP", forKey: "owner")
        UserDefaults.standard.setValue(false, forKey: "isSplashOn")
        UserDefaults.saveData(object: CellStyle.carousel, key: "list style") {}
    }
}
