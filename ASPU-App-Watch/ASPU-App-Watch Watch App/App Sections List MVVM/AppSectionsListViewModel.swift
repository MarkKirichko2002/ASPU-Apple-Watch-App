//
//  AppSectionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.09.2024.
//

import Foundation

final class AppSectionsListViewModel: ObservableObject {
    
    @Published var info = false
    @Published var isChanged = false
    @Published var alert = false
    
    var sections = AppSections.sections
    var currentId = 1
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    init() {
        getData()
        observeSectionsPosition()
    }
    
    func toggleInfo() {
        DispatchQueue.main.async {
            self.info = true
        }
    }
    
    func getData() {
        sections = []
        let first = UserDefaults.standard.string(forKey: "first section") ?? "Новости"
        let second = UserDefaults.standard.string(forKey: "second section") ?? "Расписание"
        let third = UserDefaults.standard.string(forKey: "third section") ?? "Карты"
        let fourth = UserDefaults.standard.string(forKey: "fourth section") ?? "Настройки"
        
        let value1 = AppSections.sections.first { $0.name == first }!
        let value2 = AppSections.sections.first { $0.name == second }!
        let value3 = AppSections.sections.first { $0.name == third }!
        let value4 = AppSections.sections.first { $0.name == fourth }!
        
        sections = [value1, value2, value3, value4]
        
    }
    func showInfo(id: Int) {
        currentId = id
        toggleInfo()
    }
    
    func checkSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func observeSectionsPosition() {
        NotificationCenter.default.addObserver(forName: Notification.Name("sections position changed"), object: nil, queue: nil) { _ in
            self.getData()
        }
    }
}
