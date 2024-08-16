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
    @Published var isPresented = false
    @Published var isPresentedInfo = false
    @Published var isSelected = false
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let dateManager = DateManager()
    
    func getTimetable(id: String, date: String, owner: String) {
        isLoading = true
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
    
    func saveItem(id: String, owner: String) {
        UserDefaults.standard.setValue(id, forKey: "id")
        UserDefaults.standard.setValue(owner, forKey: "owner")
    }
    
    func getCurrentDate()-> String {
        return dateManager.getCurrentDate()
    }
}
