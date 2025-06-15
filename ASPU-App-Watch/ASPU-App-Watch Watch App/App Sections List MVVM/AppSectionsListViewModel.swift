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
    
    func showInfo(id: Int) {
        currentId = id
        toggleInfo()
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
    
    func getSwipeEdge()-> swipeEdges {
        return settingsManager.getSavedSwipeEdge()
    }

    func observeSectionsPosition() {
        NotificationCenter.default.addObserver(forName: Notification.Name("sections position changed"), object: nil, queue: nil) { _ in
            self.getData()
        }
    }
}
