//
//  ASPUNewsService.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Alamofire
import Foundation

final class ASPUNewsService {

    // получить новости по факультету
    func getNews(abbreviation: String) async throws -> Result<NewsResponse, Error> {
        let parser = NewsParser()
        do {
            let response = try await parser.getArticlesByFaculty(faculty: abbreviation, page: 1)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    // получить новости АГПУ
    func getASPUNews() async throws -> Result<NewsResponse, Error> {
        let parser = NewsParser()
        do {
            let response = try await parser.getAgpuNews(page: 1)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    // получить новости по странице и факультету
    func getNews(by page: Int, abbreviation: String) async throws -> Result<NewsResponse, Error> {
        let parser = NewsParser()
        do {
            let response = try await parser.getArticlesByFaculty(faculty: abbreviation, page: page)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    // получить информацию о конкретной статье
    func getArticleInfo(abbreviation: String, id: Int) async throws -> Result<ArticleInfo, Error> {
        let parser = NewsParser()
        do {
            let article: ArticleInfo
            if abbreviation == "-" {
                article = try await parser.getArticleById(faculty: "-", id: id)
            } else {
                article = try await parser.getArticleById(faculty: abbreviation, id: id)
            }
            return .success(article)
        } catch {
            return .failure(error)
        }
    }
    
    // получить URL для пагинации
    func urlForPagination(abbreviation: String, page: Int)-> String {
        var url = ""
        if abbreviation != "-" {
            url = "http://\(HostName.host)/api/news/\(abbreviation)?page=\(page)"
            print(url)
            return url
        } else {
            url = "http://\(HostName.host)/api/news?page=\(page)"
            print(url)
            return url
        }
    }
}
