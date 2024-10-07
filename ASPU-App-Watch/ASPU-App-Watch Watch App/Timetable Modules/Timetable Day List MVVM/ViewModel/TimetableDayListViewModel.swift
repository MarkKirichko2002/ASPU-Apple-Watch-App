//
//  TimetableDayListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

final class TimetableDayListViewModel: ObservableObject {
    
    @Published var timetable = TimeTable(id: "", date: "", disciplines: [])
    @Published var currentDiscipline = Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    @Published var isLoading = true
    @Published var isPresented = false
    @Published var isPresentedInfo = false
    
    var currentID: String = ""
    var currentOwner: String = ""
    var allDisciplines = [Discipline]()
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let settingsManager = SettingsManager()
    private let dateManager = DateManager()
    
    init() {
        observedOption()
    }
    
    func getTimetable() {
        isLoading = true
        currentID = settingsManager.getSavedID()
        currentOwner = settingsManager.getSavedOwner()
        service.getTimeTableDay(id: currentID, date: dateManager.getCurrentDate(), owner: currentOwner) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.timetable = data
                    self.allDisciplines = data.disciplines
                    self.isLoading = false
                    self.checkRemainingPairsOn()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print(error)
            }
        }
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
    
    func checkTimetableChanges() {
        let id = settingsManager.getSavedID()
        if currentID != id {
            print("есть изменения")
            getTimetable()
        } else {
            print("нет изменений")
        }
    }
    
    func checkRemainingPairsOn() {
        if settingsManager.getRemainingPairsOnOption() {
            timetable.disciplines = filterLeftedPairs(pairs: timetable.disciplines)
        } else {
            timetable.disciplines = allDisciplines
        }
    }
    
    func filterLeftedPairs(pairs: [Discipline])-> [Discipline] {
        
        var disciplines = [Discipline]()
        
        let currentDate = dateManager.getCurrentDate()
        let currentTime = dateManager.getCurrentTime(isFullFormat: true)
        
        for pair in pairs {
            
            let pairEndTime = "\(pair.time.components(separatedBy: "-")[1]):00"
            
            let timetableDate = dateManager.getCurrentDate()
            
            let compareDate = dateManager.compareDates(date1: timetableDate, date2: currentDate)
            let compareTime = dateManager.compareTimes(time1: pairEndTime, time2: currentTime)
            
            // прошлый день
            if compareDate == .orderedAscending {
                return disciplines
            }
            
            // время больше и тот же день
            if compareTime == .orderedDescending && compareDate == .orderedSame {
                disciplines.append(pair)
            }
            
            // следующий день
            if compareDate == .orderedDescending {
                return timetable.disciplines
            }
        }
        
        return disciplines
    }
    
    func observedOption() {
        NotificationCenter.default.addObserver(forName: Notification.Name("remaining"), object: nil, queue: nil) { _ in
            print("option")
            self.getTimetable()
        }
    }
}
