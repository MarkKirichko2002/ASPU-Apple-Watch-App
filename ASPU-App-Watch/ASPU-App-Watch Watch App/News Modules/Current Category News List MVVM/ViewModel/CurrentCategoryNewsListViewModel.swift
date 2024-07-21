//
//  CurrentCategoryNewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class CurrentCategoryNewsListViewModel: ObservableObject {
    
    @Published var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    private let settingsManager = SettingsManager()
    
    func getNews(category: NewsCategoryModel) {
        settingsManager.saveCategory(abbreviation: category.abbreviation)
        if category.abbreviation != "-" {
            Task {
                let result = try await newsService.getNews(abbreviation: category.abbreviation)
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.newsResponse = data
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            Task {
                let result = try await newsService.getASPUNews()
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.newsResponse = data
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
