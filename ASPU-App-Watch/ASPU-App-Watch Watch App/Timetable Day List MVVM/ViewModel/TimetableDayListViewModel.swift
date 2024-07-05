//
//  TimetableDayListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

final class TimetableDayListViewModel: ObservableObject {
    
    var timetable = TimeTable(id: "", date: "", disciplines: [
        Discipline(id: UUID(), time: "8:00-9:30", name: "Разговоры о важном, Николаева Л.Г., доц.", groupName: "ВМ-ИВТ-2-1", teacherName: "Николаева Л.Г., доц.", audienceID: "23", subgroup: 0, type: .none),
        Discipline(id: UUID(), time: "9:40-11:10", name: "Базы данных", groupName: "ВМ-ИВТ-2-1", teacherName: "Лоба И.С., ст.пр.", audienceID: "13", subgroup: 1, type: .lab),
        Discipline(id: UUID(), time: "11:40-13:10", name: "Базы данных", groupName: "ВМ-ИВТ-2-1", teacherName: "Бельченко В.Е.,директор,доц.", audienceID: "13", subgroup: 1, type: .lec),
    ])
    @Published var isChanged = false
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    
    init() {
        getTimetable()
    }
    
    func getTimetable() {
        service.getTimeTableDay(id: "ВМ-ИВТ-2-1", date: "05.07.2024", owner: "GROUP") { result in
            switch result {
            case .success(let data):
                self.isChanged.toggle()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
}
