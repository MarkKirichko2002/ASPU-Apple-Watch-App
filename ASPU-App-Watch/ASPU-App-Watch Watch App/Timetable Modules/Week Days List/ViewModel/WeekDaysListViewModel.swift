//
//  WeekDaysListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class WeekDaysListViewModel: ObservableObject {
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    private let settingsManager = SettingsManager()
    
    @Published var days = [WeekDayModel]()
    @Published var isPresented = false
    @Published var isSelected = false
    @Published var currentDay = WeekDayModel(name: "", date: "")
    
    func getTimetable(week: WeekModel) {
        service.getTimeTableWeek(id: settingsManager.getSavedID(), startDate: week.from, endDate: week.to, owner: settingsManager.getSavedOwner()) { result in
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
                let model = WeekDayModel(name: dateManager.getCurrentDayOfWeek(date:  timetable[i].date ?? ""), date: timetable[i].date ?? "")
                days.append(model)
            }
        }
    }
    
    func getSavedId()-> String {
        return settingsManager.getSavedID()
    }
    
    func getSavedOwner()-> String {
        return settingsManager.getSavedOwner()
    }
}