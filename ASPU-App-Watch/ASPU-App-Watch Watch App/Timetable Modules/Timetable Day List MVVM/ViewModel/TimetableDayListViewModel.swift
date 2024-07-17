//
//  TimetableDayListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

final class TimetableDayListViewModel: ObservableObject {
    
    @Published var timetable = TimeTable(id: "", date: "", disciplines: [])
    @Published var isPresented = false
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    
    func getTimetable() {
        service.getTimeTableDay(id: "ВМ-ИВТ-2-1", date: dateManager.getCurrentDate(), owner: "GROUP") { result in
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
