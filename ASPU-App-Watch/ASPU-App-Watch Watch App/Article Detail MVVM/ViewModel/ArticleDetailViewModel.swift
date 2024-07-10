//
//  ArticleDetailViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.07.2024.
//

import Foundation

class ArticleDetailViewModel: ObservableObject {
    
    @Published var articleInfo = ArticleInfo(id: 0, title: "", description: "", date: "", images: [])
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    func getArticleInfo(abbreviation: String, id: Int) {
        Task {
            let result = try await newsService.getArticleInfo(abbreviation: abbreviation, id: id)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.articleInfo = data
                    print(data.images)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
