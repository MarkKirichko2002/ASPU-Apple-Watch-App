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
    
    var sections = AppSections.sections
    var currentId = 1
    
    init() {
        getData()
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
        UserDefaults.standard.set(index, forKey: "section id")
    }
    
    func getData() {
        let index = UserDefaults.standard.object(forKey: "section id") as? Int ?? 0
        makeImportantSection(index: index)
    }
}
