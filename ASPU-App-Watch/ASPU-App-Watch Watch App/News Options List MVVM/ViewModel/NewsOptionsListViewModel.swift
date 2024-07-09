//
//  NewsOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class NewsOptionsListViewModel: ObservableObject {
    
    @Published var options = NewsOptions.options
    var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    private let settingsManager = SettingsManager()
    
    func getData(category: NewsCategoryModel) {
        let abbreviation = settingsManager.getSavedCategory()
        guard let category = NewsCategories.categories.first(where: { $0.abbreviation ==  abbreviation}) else {return}
        getPagesCount(category: category)
    }
    
    func getPagesCount(category: NewsCategoryModel) {
        Task {
            let result = try await newsService.getNews(abbreviation: category.abbreviation)
            switch result {
            case .success(let data):
                self.newsResponse = data
                print(newsResponse)
                DispatchQueue.main.async {
                    self.options[0].name = "Категория: \(category.name)"
                    self.options[1].name = "Страниц: \(data.countPages ?? 0)"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
