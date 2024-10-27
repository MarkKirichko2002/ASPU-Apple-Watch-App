//
//  WeeksListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class WeeksListViewModel: ObservableObject {
    
    @Published var weeks = [WeekModel]()
    @Published var currentWeek = WeekModel(id: 1, from: "", to: "", dayNames: ["" : ""])
    @Published var isPresented = false
    @Published var isPresentedInfo = false
    @Published var isSelected = false
    @Published var isLoading = true
    @Published var isPresentedOptions = false
    
    // MARK: - сервисы
    private let service = TimeTableService()
    private let settingsManager = SettingsManager()
    
    func getWeeks() {
        isLoading = true
        service.getWeeks { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weeks = data
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
    
    func getSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func getSavedID()-> String {
        return settingsManager.getSavedID()
    }
    
    func getSavedOwner()-> String {
        return settingsManager.getSavedOwner()
    }
}
