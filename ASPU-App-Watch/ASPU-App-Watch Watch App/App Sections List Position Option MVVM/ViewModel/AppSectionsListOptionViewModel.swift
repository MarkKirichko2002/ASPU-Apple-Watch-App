//
//  AppSectionsListOptionViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 31.10.2024.
//

import Foundation

final class AppSectionsListOptionViewModel: ObservableObject {
    
    var sections = AppSections.sections
    @Published var isChanged = false
    @Published var alert = false
    
    init() {
        getData()
    }
    
    func getData() {
        print(loadSections())
        if !loadSections().isEmpty {
            self.sections = loadSections()
            isChanged.toggle()
        }
    }
    
    func saveSections(sections: [AppSectionModel]) {
        saveArray(array: sections)
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
    
    func saveArray(array: [AppSectionModel]) {
        do {
            let arr = try JSONEncoder().encode(array)
            UserDefaults.standard.setValue(arr, forKey: "sections")
            getData()
            sendNotification()
        } catch {
            print(error)
        }
    }
    
    func changeVisibility(index: Int) {
        if index == 4 {
            alert.toggle()
        } else {
            toggleVisibility(index: index)
        }
    }
    
    func toggleVisibility(index: Int) {
        let id = sections.firstIndex { $0.id == index } ?? 0
        if sections[id].isVisible {
            sections[id].isVisible = false
            isChanged.toggle()
        } else {
            sections[id].isVisible = true
            isChanged.toggle()
        }
    }
    
    func sendNotification() {
        NotificationCenter.default.post(name: Notification.Name("sections position changed"), object: nil)
    }
}
