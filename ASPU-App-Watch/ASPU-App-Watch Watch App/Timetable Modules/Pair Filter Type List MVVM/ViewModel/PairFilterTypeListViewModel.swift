//
//  PairFilterTypeListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import Foundation

final class PairFilterTypeListViewModel: ObservableObject {
    
    var date: String = ""
    var disciplines = [Discipline]()
    var allDisciplines = [Discipline]()
    
    @Published var types = PairTypes.types
    @Published var isFiltered = false
    
    // MARK: - сервисы
    let dateManager = DateManager()
    
    // MARK: - Init
    func setUpData(date: String, disciplines: [Discipline]) {
        self.date = date
        self.disciplines = disciplines
        getData()
    }
    
    func getData() {
        for i in 0...types.count - 1 {
            types[i].count = countForPairType(type: types[i].type)
        }
        isFiltered = true
    }
    
    func countForPairType(type: PairType)-> Int {
        
        var filteredData = [Discipline]()
        var uniqueTimes: Set<String> = Set()
        
        allDisciplines = disciplines
        
        if type != .all {
            filteredData = type == .leftToday ? filterLeftedPairs(pairs: disciplines) : disciplines.filter({ $0.type == type })
        } else {
            filteredData = disciplines
        }
        
        if type != .all {
            
            for pair in filteredData {
                
                let times = pair.time.components(separatedBy: "-")
                let startTime = times[0]
                
                uniqueTimes.insert(startTime)
            }
        } else {
            return disciplines.count
        }
        
        return uniqueTimes.count
        
    }
    
    func filterLeftedPairs(pairs: [Discipline])-> [Discipline] {
        
        var disciplines = [Discipline]()
        
        let currentDate = dateManager.getCurrentDate()
        let currentTime = dateManager.getCurrentTime(isFullFormat: true)
        
        for pair in pairs {
            
            let pairEndTime = "\(pair.time.components(separatedBy: "-")[1]):00"
            
            let timetableDate = date
            
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
                return allDisciplines
            }
        }
        
        return disciplines
    }
    
    func filterDisciplines(type: PairType)-> [Discipline] {
        
        var disciplines = disciplines
        
        if type == .all {
            
            if self.allDisciplines.isEmpty {
                self.allDisciplines = disciplines
            }
            
            disciplines = self.allDisciplines
            
        } else if type == .leftToday {
            
            let filteredDisciplines = self.filterLeftedPairs(pairs: self.allDisciplines)
            disciplines = filteredDisciplines
            
        } else {
            
            if self.allDisciplines.isEmpty {
                self.allDisciplines = disciplines
            }
            
            let filteredDisciplines = self.allDisciplines.filter { $0.type == type }
            return filteredDisciplines
        }
        
        return disciplines
    }
}
