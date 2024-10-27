//
//  NewsFilterOptionListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import Foundation

final class NewsFilterOptionListViewModel: ObservableObject {
    
    @Published var options = NewsFilters.options
    @Published var isPresented = false
    private var articles = [Article]()
    
    // MARK: - сервисы
    private let dateManager = DateManager()
    
    func getInfo(articles: [Article]) {
        self.options[0].count = articles.filter({ $0.date == dateManager.getCurrentDate()}).count
        self.options[1].count = articles.filter({ $0.date == dateManager.previousDay(date: dateManager.getCurrentDate())}).count
        self.options[2].count = articles.filter({ $0.date == dateManager.previousDay(date: dateManager.previousDay(date: dateManager.getCurrentDate()))}).count
        self.options[3].count = articles.count
        self.articles = articles
    }
    
    func filterNews(option: NewsOptionsFilters)-> [Article] {
        switch option {
        case .today:
            return articles.filter({ $0.date == dateManager.getCurrentDate()})
        case .yesterday:
            let today = dateManager.getCurrentDate()
            let yesterday = dateManager.previousDay(date: today)
            return articles.filter({ $0.date == yesterday })
        case .dayBeforeYesterday:
            let today = dateManager.getCurrentDate()
            let yesterday = dateManager.previousDay(date: today)
            let dayBeforeYesterday = dateManager.previousDay(date: yesterday)
            return articles.filter({ $0.date == dayBeforeYesterday })
        case .all:
            return articles
        }
    }
}
