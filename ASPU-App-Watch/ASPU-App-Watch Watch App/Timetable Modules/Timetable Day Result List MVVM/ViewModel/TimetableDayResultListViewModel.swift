//
//  TimetableDayResultListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import Foundation

final class TimetableDayResultListViewModel: ObservableObject {
    
    @Published var timetable = TimeTable(id: "", date: "", disciplines: [])
    @Published var currentDiscipline = Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    @Published var isLoading = true
    @Published var isPresentedInfo = false
    @Published var isPresentedOptions = false
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    private let settingsManager = SettingsManager()
    
    var currentID: String = ""
    var currentOwner: String = ""
    
    func getTimetable(id: String, date: String, owner: String) {
        isLoading = true
        currentID = settingsManager.getSavedID()
        saveItem(id: id, owner: owner)
        service.getTimeTableDay(id: id, date: date, owner: owner) { result in
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
    
    func checkTimetableChanges() {
        let id = settingsManager.getSavedID()
        let owner = settingsManager.getSavedOwner()
        if currentID != id {
            print("есть изменения")
            getTimetable(id: id, date: dateManager.getCurrentDate(), owner: owner)
        } else {
            print("нет изменений")
        }
    }
    
    func saveItem(id: String, owner: String) {
        UserDefaults.standard.setValue(id, forKey: "id")
        UserDefaults.standard.setValue(owner, forKey: "owner")
    }
    
    func sendNotification(id: String, owner: String) {
        let item = TimetableItem(id: id, owner: owner)
        NotificationCenter.default.post(name: Notification.Name("timetable item"), object: item)
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
}
