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
    @Published var isLoading = true
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let settingsManager = SettingsManager()
    private let dateManager = DateManager()
    
    func getTimetable() {
        isLoading = true
        service.getTimeTableDay(id: settingsManager.getSavedID(), date: dateManager.getCurrentDate(), owner: settingsManager.getSavedOwner()) { result in
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
}
