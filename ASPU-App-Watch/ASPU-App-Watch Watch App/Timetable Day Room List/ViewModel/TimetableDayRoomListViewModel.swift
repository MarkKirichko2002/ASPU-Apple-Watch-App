//
//  TimetableDayRoomListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import Foundation

class TimetableDayRoomListViewModel: ObservableObject {
    
    var timetable = TimeTable(id: "", date: "", disciplines: [])
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    
    func getTimetable(room: String) {
        service.getTimeTableDay(id: room, date: dateManager.getCurrentDate(), owner: "ROOM") { result in
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
