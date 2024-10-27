//
//  TimetableDaysInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.10.2024.
//

import Foundation

final class TimetableDaysInfoViewModel: ObservableObject {
    
    let service = TimeTableService()
    let newsService = ASPUNewsService()
    let dateManager = DateManager()
    @Published var days = [WeekDayModel]()
    @Published var isLoading = true
    
    func getDays(week: WeekModel, id: String, owner: String) {
        service.getTimeTableWeek(id: id, startDate: week.from, endDate: week.to, owner: owner) { result in
            switch result {
            case .success(let data):
                self.configure(week: week, timetable: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configure(week: WeekModel, timetable: [TimeTable]) {
        if !timetable.isEmpty {
            for i in 0..<timetable.count {
                let model = WeekDayModel(name: self.dateManager.getCurrentDayOfWeek(date:  timetable[i].date ?? ""), date: timetable[i].date ?? "")
                self.days.append(model)
            }
        }
        isLoading.toggle()
    }
}
