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
    @Published var isSelected = false
    
    var currentID: String = ""
    var currentOwner: String = ""
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let settingsManager = SettingsManager()
    private let dateManager = DateManager()
    
    init() {
        getTimetable()
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
                    self.isLoading = false
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
}
