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
    
    func makeImportantSection(index: Int) {
        sections = []
        sections.append(AppSections.sections[index])
        for i in 0...AppSections.sections.count - 1 {
            if !sections.contains(where: { $0.id == AppSections.sections[i].id }) {
                sections.append(AppSections.sections[i])
            }
        }
        saveImportantSection(index: index)
        isChanged.toggle()
    }
        
    func saveImportantSection(index: Int) {
        settingsManager.saveSection(index: index)
    }
    
    func getData() {
        let id = settingsManager.getSectionId()
        makeImportantSection(index: id)
    }
    
    func resetSections() {
        sections = AppSections.sections
        saveImportantSection(index: 0)
        isChanged.toggle()
    }
    
    func showInfo(id: Int) {
        currentId = id
        toggleInfo()
    }
    
    func checkSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func checkSwipeFromLeft()-> SwipeActions {
        return settingsManager.getSwipeFromLeftOption()
    }
    
    func checkSwipeFromRight()-> SwipeActions {
        return settingsManager.getSwipeFromRightOption()
    }
    
    func observeSectionsPosition() {
        NotificationCenter.default.addObserver(forName: Notification.Name("reset sections position"), object: nil, queue: nil) { _ in
            self.resetSections()
        }
    }
}
