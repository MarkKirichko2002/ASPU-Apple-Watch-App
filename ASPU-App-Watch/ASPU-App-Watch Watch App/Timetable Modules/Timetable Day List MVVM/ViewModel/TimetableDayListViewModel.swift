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
    @Published var currentDisciplines = [Discipline]()
    @Published var isLoading = true
    @Published var isPresented = false
    @Published var isPresentedInfo = false
    @Published var isPresentedPairs = false
    
    var currentID: String = ""
    var currentOwner: String = ""
    var allDisciplines = [Discipline]()
    @Published var date: String = ""
    
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
        date = dateManager.getCurrentDate()
        service.getTimeTableDay(id: currentID, date: date, owner: currentOwner) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.timetable = data
                    self.allDisciplines = data.disciplines
                    self.isLoading = false
                    self.checkSettings()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.checkSettings()
                }
                print(error)
            }
        }
    }
    
    func getTimetable(date: String) {
        isLoading = true
        currentID = settingsManager.getSavedID()
        currentOwner = settingsManager.getSavedOwner()
        service.getTimeTableDay(id: currentID, date: date, owner: currentOwner) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.timetable = data
                    self.allDisciplines = data.disciplines
                    self.isLoading = false
                    self.checkNextDayOnOption()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.checkNextDayOnOption()
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
    
    func checkSettings() {
        checkRemainingPairsOn()
        checkCurrentPairInfoOption()
    }
    
    func checkRemainingPairsOn() {
        if settingsManager.getRemainingPairsOnOption() {
            timetable.disciplines = filterLeftedPairs(pairs: timetable.disciplines)
            checkNextDayOnOption()
        } else {
            timetable.disciplines = allDisciplines
        }
    }
    
    func checkNextDayOnOption() {
        if settingsManager.getNextDayOnOption() {
            if timetable.disciplines.isEmpty {
                date = dateManager.nextDay(date: date)
                getTimetable(date: date)
            }
        }
    }
    
    func checkCurrentPairInfoOption() {
        guard settingsManager.getCurrentPairInfoOption() else { return }
        checkCurrentPairs(pairs: allDisciplines)
    }
    
    func checkCurrentPairs(pairs: [Discipline]) {
        let leftedPairs = filterLeftedPairs(pairs: pairs)
        let filteredleftedPairs = leftedPairs.filter { $0.time == leftedPairs.first?.time }
        let count = filteredleftedPairs.count
        guard timetable.date == dateManager.getCurrentDate() else { return }
        switch count {
        case 1:
            self.currentDiscipline = filteredleftedPairs.first!
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.isPresentedInfo.toggle()
            }
        case _ where count > 1:
            self.currentDisciplines = filteredleftedPairs
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.isPresentedPairs.toggle()
            }
        default:
            break
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
