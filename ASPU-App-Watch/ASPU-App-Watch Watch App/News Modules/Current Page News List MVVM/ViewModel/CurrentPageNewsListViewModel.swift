//
//  CurrentPageNewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.07.2024.
//

import Foundation

final class CurrentPageNewsListViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    func getNews(page: Int, abbreviation: String) {
        Task {
            let result = try await newsService.getNews(by: page, abbreviation: abbreviation)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.articles = data.articles ?? []
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
