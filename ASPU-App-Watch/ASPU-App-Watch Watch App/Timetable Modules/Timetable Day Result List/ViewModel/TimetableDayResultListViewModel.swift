//
//  TimetableDayResultListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import Foundation

class TimetableDayResultListViewModel: ObservableObject {
    
    var timetable = TimeTable(id: "", date: "", disciplines: [])
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    
    func getTimetable(id: String, owner: String) {
        service.getTimeTableDay(id: id, date: dateManager.getCurrentDate(), owner: owner) { result in
            switch result {
            case .success(let data):
                self.timetable = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
}
