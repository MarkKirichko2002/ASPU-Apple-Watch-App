//
//  DaysListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

final class DaysListViewModel: ObservableObject {
    
    var id: String = ""
    var currentDate: String = ""
    var owner: String = ""
    
    var days = DaysList.days
    var currentDay = DaysList.days[0]
    
    // MARK: - сервисы
    let timetableService = TimeTableService()
    let dateManager = DateManager()
    let settingsManager = SettingsManager()
    
    @Published var isChanged = false
    @Published var isPresented = false
    
    
    // MARK: - Init
    init(id: String, currentDate: String, owner: String) {
        self.id = id
        self.currentDate = currentDate
        self.owner = owner
    }
    
    func setUpData() {
        // даты
        days[0].date = dateManager.getCurrentDate()
        days[1].date = dateManager.nextDay(date: currentDate)
        days[2].date = dateManager.previousDay(date: currentDate)
        
        // дни недели
        days[0].dayOfWeek = dateManager.getCurrentDayOfWeek(date: currentDate)
        days[1].dayOfWeek = dateManager.getCurrentDayOfWeek(date: dateManager.nextDay(date: currentDate))
        days[2].dayOfWeek = dateManager.getCurrentDayOfWeek(date: dateManager.previousDay(date: currentDate))
        
        // информация о количестве пар
        days[0].info = "загрузка..."
        days[1].info = "загрузка..."
        days[2].info = "загрузка..."
        
        getTimetableInfo()
    }
    
    func getTimetableInfo() {
        let dispatchGroup = DispatchGroup()
        for day in days {
            dispatchGroup.enter()
            timetableService.getTimeTableDay(id: id, date: day.date, owner: owner) { [weak self] result in
                defer { dispatchGroup.leave() }
                switch result {
                case .success(let timetable):
                    if !timetable.disciplines.isEmpty {
                        // просто расписание
                        let day = self?.days.first { $0.name == day.name }
                        let index = self?.days.firstIndex(of: day!)
                        let pairsCount = self?.getPairsCount(pairs: timetable.disciplines) ?? 0
                        // особые дни
                        let coursesCount = self?.getCoursesCount(pairs: timetable.disciplines) ?? 0
                        let testsCount = self?.getTestsCount(pairs: timetable.disciplines) ?? 0
                        let consCount = self?.getConsCount(pairs: timetable.disciplines) ?? 0
                        let examsCount = self?.getExamsCount(pairs: timetable.disciplines) ?? 0
                        let holidaysExisting = self?.checkHolidaysExisting(pairs: timetable.disciplines)
                        
                        if pairsCount > 0 {
                            self?.days[index!].info = "пар: \(self?.getPairsCount(pairs: timetable.disciplines) ?? 0)"
                        }
                        
                        if coursesCount > 0 {
                            self?.days[index!].info = coursesCount > 1 ? "курсовые" : "курсовая!"
                        }
                        
                        if testsCount > 0 {
                            self?.days[index!].info = testsCount > 1 ? "зачеты" : "зачет"
                        }
                        
                        if consCount > 0 {
                            self?.days[index!].info = "конс."
                        }
                        
                        if examsCount > 0 {
                            self?.days[index!].info = examsCount > 1 ? "экзамены!" : "экзамен!"
                        }
                        
                        if holidaysExisting ?? false {
                            self?.days[index!].info = "каникулы!"
                        }
                    } else {
                        let day = self?.days.first { $0.name == day.name }
                        let index = self?.days.firstIndex(of: day!)
                        self?.days[index!].info = "нет пар"
                    }
                case .failure(let error):
                    let day = self?.days.first { $0.name == day.name }
                    let index = self?.days.firstIndex(of: day!)
                    self?.days[index!].info = "нет пар"
                    self?.isChanged.toggle()
                    print(error)
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.isChanged.toggle()
        }
    }
    
    // подсчет пар
    func getPairsCount(pairs: [Discipline])-> Int {
        
        var uniqueTimes: Set<String> = Set()
        
        for pair in pairs {
            
            let times = pair.time.components(separatedBy: "-")
            let startTime = times[0]
                            
            uniqueTimes.insert(startTime)
        }
        
        return uniqueTimes.count
    }
    
    // подсчет курсовых
    func getCoursesCount(pairs: [Discipline])-> Int {
        
        var uniqueCourses: Set<String> = Set()
        
        for pair in pairs {
            
            if pair.name.contains("курсов.") {
                uniqueCourses.insert(pair.name)
            }
        }
        
        return uniqueCourses.count
    }
    
    // подсчет зачетов
    func getTestsCount(pairs: [Discipline])-> Int {
        
        var uniqueTimes: Set<String> = Set()
        
        for pair in pairs {
            
            if pair.type == .cred {
                
                let times = pair.time.components(separatedBy: "-")
                let startTime = times[0]
                
                uniqueTimes.insert(startTime)
            }
        }
        
        return uniqueTimes.count
    }
    
    // подсчет консультаций
    func getConsCount(pairs: [Discipline])-> Int {
        
        var uniqueCons: Set<String> = Set()
        
        for pair in pairs {
            
            if pair.type == .cons {
                uniqueCons.insert(pair.name)
            }
        }
        
        return uniqueCons.count
    }
    
    // подсчет экзаменов
    func getExamsCount(pairs: [Discipline])-> Int {
        
        var uniqueExams: Set<String> = Set()
        
        for pair in pairs {
            
            if pair.type == .exam {
                uniqueExams.insert(pair.name)
            }
        }
        
        return uniqueExams.count
    }
    
    // проверка каникул
    func checkHolidaysExisting(pairs: [Discipline])-> Bool {
        
        for pair in pairs {
            if pair.name.contains("Каникулы") {
                return true
            }
        }
        return false
    }
    
    func timeTableColor(day: DayModel)-> Color {
        if day.info.contains("пар:") {
            return .green
        } else if day.info.contains("зачет") || day.info.contains("конс")  {
            return .yellow
        } else if day.info.contains("экзамен") || day.info.contains("курс")  {
            return .red
        } else {
            return .gray
        }
    }
}
