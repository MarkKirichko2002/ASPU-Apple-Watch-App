//
//  TimetableInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import Foundation

final class TimetableInfoViewModel: ObservableObject {
    
    let service = TimeTableService()
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    @Published var info = ["Загрузка..."]
    
    // Расписание
    func getTimetable(id: String, owner: String) {
        service.getTimeTableDay(id: id, date: dateManager.getCurrentDate(), owner: owner) { result in
            switch result {
            case .success(let data):
                self.info = []
                if !data.disciplines.isEmpty {
                    self.info.append("Сегодня пар: \(self.getPairsCount(pairs: data.disciplines))")
                } else {
                    self.info.append("Сегодня нет пар")
                }
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
}
