//
//  InfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import Foundation

final class InfoViewModel: ObservableObject {
    
    @Published var isChanged = false
    
    let service = TimeTableService()
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    var info = ["Загрузка..."]
    
    func infoIcon(id: Int)-> String {
        if id == 1 {
            return "mail"
        } else {
            return "clock"
        }
    }
    
    // Расписание
    func getTimetable() {
        let currentID = settingsManager.getSavedID()
        let currentOwner = settingsManager.getSavedOwner()
        service.getTimeTableDay(id: currentID, date: dateManager.getCurrentDate(), owner: currentOwner) { result in
            switch result {
            case .success(let data):
                self.info = []
                if !data.disciplines.isEmpty {
                    self.info.append("Сегодня пар: \(self.getPairsCount(pairs: data.disciplines))")
                } else {
                    self.info.append("Сегодня нет пар")
                }
                self.toggleAlert()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPairsCount(pairs: [Discipline])-> Int {
        
        var uniqueTimes: Set<String> = Set()
        
        for pair in pairs {
            
            let times = pair.time.components(separatedBy: "-")
            let startTime = times[0]
            
            uniqueTimes.insert(startTime)
        }
        
        return uniqueTimes.count
    }
    
    func toggleAlert() {
        DispatchQueue.main.async {
            self.isChanged = true
        }
    }
}
