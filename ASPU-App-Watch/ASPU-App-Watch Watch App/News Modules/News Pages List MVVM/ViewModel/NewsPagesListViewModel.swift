//
//  NewsPagesListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 20.07.2024.
//

import Foundation

final class NewsPagesListViewModel: ObservableObject {
    
    @Published var pages = [Int]()
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    private let settingsManager = SettingsManager()
    
    init() {
        getPages()
    }
    
    func getPages() {
        let abbreviation = settingsManager.getSavedCategory()
        guard let category = NewsCategories.categories.first(where: { $0.abbreviation ==  abbreviation}) else {return}
        if category.abbreviation != "-" {
            Task {
                let result = try await newsService.getNews(abbreviation: category.abbreviation)
                switch result {
                case .success(let data):
                    self.setUpData(count: data.countPages ?? 0)
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            Task {
                let result = try await newsService.getASPUNews()
                switch result {
                case .success(let data):
                    self.setUpData(count: data.countPages ?? 0)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func setUpData(count: Int) {
        
        for i in 1...count {
            DispatchQueue.main.async {
                self.pages.append(i)
            }
        }
    }
}
