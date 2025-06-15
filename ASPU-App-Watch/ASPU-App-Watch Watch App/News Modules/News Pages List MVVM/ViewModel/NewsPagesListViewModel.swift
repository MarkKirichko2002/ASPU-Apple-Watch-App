//
//  NewsPagesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 20.07.2024.
//

import Foundation

final class NewsPagesListViewModel: ObservableObject {
    
    @Published var pages = [Int]()
    @Published var isInfoSelected = false
    @Published var isInfoPresented = false
    @Published var currentPage = 0
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    func setUpData(count: Int) {
        for i in 1...count {
            DispatchQueue.main.async {
                self.pages.append(i)
            }
        }
    }
    
    func checkSwipeOption()-> Bool {
        return settingsManager.getSwipeOnOption()
    }
    
    func getSwipeEdge()-> swipeEdges {
        return settingsManager.getSavedSwipeEdge()
    }
}
