//
//  AppSectionsMenuViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.11.2024.
//

import Foundation

final class AppSectionsMenuViewModel: ObservableObject {
    
    @Published var isChanged = false
    @Published var section: AppSectionModel?
    
    var sections = AppSections.sections
    var index = 0
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    init() {
        getData()
        observeSectionsPosition()
    }
    
    func getData() {
        if !loadSections().isEmpty {
            checkVisibility()
            isChanged.toggle()
        }
    }
    
    func checkVisibility() {
        sections = []
        for section in loadSections() {
            if section.isVisible {
                sections.append(section)
            }
        }
    }
    
    func checkSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func getSavedID()-> String {
        return settingsManager.getSavedID()
    }
    
    func getSavedOwner()-> String {
        return settingsManager.getSavedOwner()
    }
        
    func loadSections()-> [AppSectionModel] {
        var data = [AppSectionModel]()
        if let result = UserDefaults.standard.object(forKey: "sections") as? Data {
            do {
                data = try JSONDecoder().decode([AppSectionModel].self, from: result)
            } catch {
                print(error)
            }
        }
        return data
    }
    
    func handleSection() {
        self.section = currentSection()
    }
    
    func currentSection()-> AppSectionModel {
        return sections[index]
    }
    
    func nextSection()  {
        if index < sections.count - 1 {
            index += 1
        }
        isChanged.toggle()
    }
    
    func pastSection() {
        if index > 0 {
            index -= 1
        }
        isChanged.toggle()
    }
    
    func isFirstSection()-> Bool {
        if index == 0 {
            return true
        } else {
            return false
        }
    }
    
    func isLastSection()-> Bool {
        if index == sections.count - 1 {
            return true
        } else {
            return false
        }
    }

    func observeSectionsPosition() {
        NotificationCenter.default.addObserver(forName: Notification.Name("sections position changed"), object: nil, queue: nil) { _ in
            self.index = 0
            self.getData()
        }
    }
}

