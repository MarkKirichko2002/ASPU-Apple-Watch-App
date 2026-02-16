//
//  TimetableDayTimeInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 28.04.2025.
//

import Foundation

final class TimetableDayTimeInfoViewModel: ObservableObject {
    
    @Published var info = [""]
    @Published var isPresented = false
    @Published var isLoading = true
    
    // MARK: - сервисы
    let service = TimeTableService()
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    // Расписание
    func getTimetable(id: String, date: String, owner: String) {
        service.getTimeTableDay(id: id, date: date, owner: owner) { result in
            switch result {
            case .success(let data):
                self.info = []
                if !data.disciplines.isEmpty {
                    let firstPair = data.disciplines.first!
                    let lastPair = data.disciplines.last!
                    self.info.append("Первая пара: \(firstPair.time)")
                    self.info.append("Последняя пара: \(lastPair.time)")
                    self.info.append(self.countTimetableTime(startPair: firstPair, lastPair: lastPair, date: date))
                    self.isLoading = false
                } else {
                    self.info.append("\(date) нет пар")
                    self.isLoading = false
                }
            case .failure(let error):
                self.isLoading = false
                print(error)
            }
        }
    }
    
    func countTimetableTime(startPair: Discipline, lastPair: Discipline, date: String)-> String {
        
        let startTime = "\(date) \(getStartTime(pair: startPair))"
        let endTime = "\(date) \(getEndTime(pair: lastPair))"
        
        let info = self.dateManager.getInfoFromDates(date: startTime, date2: endTime)
        
        if (abs(info.hour ?? 0)) == 0 && (abs(info.minute ?? 0)) == 0 {
            return "Нет пар"
        } else {
            return "Суммарное время пар: \(abs(info.hour ?? 0)) ч. \(abs(info.minute ?? 0)) мин."
        }
    }
    
    func getStartTime(pair: Discipline)-> String {
        let times = pair.time.components(separatedBy: "-")
        let startTime = times[0] + ":00"
        return startTime
    }
    
    func getEndTime(pair: Discipline)-> String {
        let times = pair.time.components(separatedBy: "-")
        let startTime = times[1] + ":00"
        return startTime
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
}
