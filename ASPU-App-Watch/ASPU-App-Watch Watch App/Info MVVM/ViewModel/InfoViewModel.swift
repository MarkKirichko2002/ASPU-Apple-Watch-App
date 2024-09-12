//
//  InfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import Foundation

final class InfoViewModel: ObservableObject {
    
    @Published var isChanged = false
    
    let service = TimeTableService()
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    var info = ["Загрузка..."]
    var count = 0
    
    func infoIcon(id: Int)-> String {
        if id == 1 {
            return "mail"
        } else {
            return "clock"
        }
    }
    
    func checkInfo(id: Int) {
        if id == 1 {
            checkWhatsNew()
        } else {
            getTimetable()
        }
    }
    
    // новости
    func checkWhatsNew() {
        let dispatchGroup = DispatchGroup()
        for category in NewsCategories.categories {
            dispatchGroup.enter()
            if category.abbreviation != "-" {
                Task {
                    let result = try await newsService.getNews(abbreviation: category.abbreviation)
                    defer { dispatchGroup.leave() }
                    switch result {
                    case .success(let data):
                        if checkTodayNews(news: data.articles ?? []) {
                            self.info = []
                            self.info.append("Сегодня новостей: \(countTodayNews(news: data.articles ?? []))")
                            self.count = countTodayNews(news: data.articles ?? [])
                        } else {
                            if count > 0 {} else {
                                self.info = []
                                self.info.append("Сегодня новостей нет")
                                self.count = countTodayNews(news: data.articles ?? [])
                            }
                        }
                    case .failure(let error):
                        print(error)
                        break
                    }
                }
            } else {
                Task {
                    let result = try await newsService.getASPUNews()
                    defer { dispatchGroup.leave() }
                    switch result {
                    case .success(let data):
                        if checkTodayNews(news: data.articles ?? []) {
                            self.info = []
                            self.info.append("Сегодня новостей: \(countTodayNews(news: data.articles ?? []))")
                            self.count = countTodayNews(news: data.articles ?? [])
                        } else {
                            if count > 0 {} else {
                                self.info = []
                                self.info.append("Сегодня новостей нет")
                                self.count = countTodayNews(news: data.articles ?? [])
                            }
                        }
                    case .failure(let error):
                        print(error)
                        break
                    }
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            print(self.count)
            self.toggleAlert()
        }
    }
    
    func checkTodayNews(news: [Article])-> Bool {
        let currentDate = dateManager.getCurrentDate()
        for article in news {
            if article.date == currentDate {
                print("есть новости за сегодня!")
                return true
            }
        }
        return false
    }
    
    func countTodayNews(news: [Article])-> Int {
        let currentDate = dateManager.getCurrentDate()
        var articles = [Article]()
        for article in news {
            if article.date == currentDate {
                articles.append(article)
            }
        }
        return articles.count
    }
    
    // Расписание
    func getTimetable() {
        let currentID = settingsManager.getSavedID()
        let currentOwner = settingsManager.getSavedOwner()
        service.getTimeTableDay(id: currentID, date: dateManager.getCurrentDate(), owner: currentOwner) { result in
            switch result {
            case .success(let data):
                self.info = []
                if !data.disciplines.isEmpty {
                    self.info.append("Сегодня пар: \(self.getPairsCount(pairs: data.disciplines))")
                } else {
                    self.info.append("Сегодня нет пар")
                }
                self.toggleAlert()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPairsCount(pairs: [Discipline])-> Int {
        
        var uniqueTimes: Set<String> = Set()
        
        for pair in pairs {
            
            let times = pair.time.components(separatedBy: "-")
            let startTime = times[0]
            
            uniqueTimes.insert(startTime)
        }
        
        return uniqueTimes.count
    }
    
    func toggleAlert() {
        if !isChanged {
            DispatchQueue.main.async {
                self.isChanged = true
            }
        }
    }
}
