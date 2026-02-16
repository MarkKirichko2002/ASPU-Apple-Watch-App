//
//  NewsGroupDateFilterListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.06.2025.
//

import Foundation

final class NewsGroupDateFilterListViewModel: ObservableObject {
    
    @Published var sections = [NewsDateSectionModel]()
    var currentCategory = NewsCategories.categories[0]
    
    func setUpDate(articles: [Article], abbreviation: String) {
        self.currentCategory = NewsCategories.categories.first(where: { $0.abbreviation ==  abbreviation})!
        for article in articles {
            let model = NewsDateSectionModel(date: article.date ?? "", abbreviation: currentCategory.abbreviation, news: articles.filter({ $0.date == article.date }))
            if !sections.contains(where: { $0.date == model.date }) {
                sections.append(model)
            }
        }
    }
}
