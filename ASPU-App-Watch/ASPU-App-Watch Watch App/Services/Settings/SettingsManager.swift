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
    
    func getFullPairInfoOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isFullPairInfoOn") as? Bool ?? false
    }
    
    func getDistanceForBuilding()-> Int {
        return UserDefaults.standard.object(forKey: "distance") as? Int ?? 300
    }
    
    func getSwipeOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    }
    
    func getSwipeFromLeftOption()-> SwipeActions {
        let option = UserDefaults.loadData(type: SwipeActions.self, key: "swipe from left")
        return option ?? SwipeActions.info
    }
    
    func getSwipeFromRightOption()-> SwipeActions {
        let option = UserDefaults.loadData(type: SwipeActions.self, key: "swipe from right")
        return option ?? SwipeActions.up
    }
    
    func getSavedListStyle()-> CellStyle {
        return UserDefaults.loadData(type: CellStyle.self, key: "list style") ?? CellStyle.carousel
    }
}
