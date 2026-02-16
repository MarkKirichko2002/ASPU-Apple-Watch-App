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
    
    func getGroupByDatesOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isGroupByDatesOn") as? Bool ?? false
    }
    
    func getShowArticleWordsCount()-> Bool {
        return UserDefaults.standard.object(forKey: "isShowArticleWordsCountOn") as? Bool ?? false
    }
    
    func getSavedCategory()-> String {
        let savedCategory = UserDefaults.standard.object(forKey: "news category") as? String ?? "-"
        return savedCategory
    }
    
    func getSavedID()-> String {
        return UserDefaults.standard.object(forKey: "id") as? String ?? "ВМ-ИВТ-4-1"
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
    
    func getSectionsDisplayOption()-> SectionDisplayOptions {
        return UserDefaults.loadData(type: SectionDisplayOptions.self, key: "sections display option") ?? .list
    }
    
    func getRemainingPairsOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    }
    
    func getRemainingWeeksOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isRemainingWeeksOn") as? Bool ?? false
    }
    
    func getNextDayOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isNextDayOn") as? Bool ?? false
    }
    
    func getFullPairInfoOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isFullPairInfoOn") as? Bool ?? false
    }
    
    func getCurrentPairInfoOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isShowCurrentPairInfoOn") as? Bool ?? false
    }
    
    func getTimetableDisplayOption()-> TimetableDisplayOptions {
        return UserDefaults.loadData(type: TimetableDisplayOptions.self, key: "timetable display option") ?? .day
    }
    
    func getNavigationBarOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isNavigationBar") as? Bool ?? false
    }
    
    func getArrowsColor()-> AppColors {
        return UserDefaults.loadData(type: AppColors.self, key: "arrow color") ?? AppColors.system
    }
    
    func getSwipeOnOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    }
    
    func getSavedSplashScreen()-> splashScreenOptions {
        return UserDefaults.loadData(type: splashScreenOptions.self, key: "splash screen") ?? splashScreenOptions.none
    }
    
    func getSavedListStyle()-> CellStyle {
        return UserDefaults.loadData(type: CellStyle.self, key: "list style") ?? CellStyle.carousel
    }
    
    func saveLineLimit(limit: LineLimits) {
        UserDefaults.saveData(object: limit, key: "line limit") {}
    }
    
    func getSavedLineLimit()-> LineLimits {
        return UserDefaults.loadData(type: LineLimits.self, key: "line limit") ?? LineLimits.unlimited
    }
    
    func saveLetterCase(letterCase: LetterCases) {
        UserDefaults.saveData(object: letterCase, key: "letter case") {}
    }
    
    func getSavedLetterCase()-> LetterCases {
        return UserDefaults.loadData(type: LetterCases.self, key: "letter case") ?? LetterCases.mixed
    }
    
    func saveSwipeEdge(edge: swipeEdges) {
        UserDefaults.saveData(object: edge, key: "swipe edge") {}
    }
    
    func getSavedSwipeEdge()-> swipeEdges {
        return UserDefaults.loadData(type: swipeEdges.self, key: "swipe edge") ?? swipeEdges.right
    }
}
