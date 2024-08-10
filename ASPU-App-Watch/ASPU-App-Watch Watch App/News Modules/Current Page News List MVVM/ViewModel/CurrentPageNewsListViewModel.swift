//
//  CurrentPageNewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.07.2024.
//

import Foundation

final class CurrentPageNewsListViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    @Published var isLoading = true
    
    var abbreviation: String = ""
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    init(page: Int, abbreviation: String) {
        self.abbreviation = abbreviation
        getNews(page: page, abbreviation: abbreviation)
    }
    
    func getNews(page: Int, abbreviation: String) {
        isLoading = true
        Task {
            let result = try await newsService.getNews(by: page, abbreviation: abbreviation)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.articles = data.articles ?? []
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
    
    func getCategoryName()-> String {
        return NewsCategories.categories.first { $0.abbreviation == abbreviation}?.name ?? ""
    }
}
