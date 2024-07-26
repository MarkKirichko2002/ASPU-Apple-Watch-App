//
//  WeeksListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

final class WeeksListViewModel: ObservableObject {
    
    @Published var weeks = [WeekModel]()
    
    // MARK: - сервисы
    private let service = TimeTableService()
    
    func getWeeks() {
        service.getWeeks { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weeks = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
