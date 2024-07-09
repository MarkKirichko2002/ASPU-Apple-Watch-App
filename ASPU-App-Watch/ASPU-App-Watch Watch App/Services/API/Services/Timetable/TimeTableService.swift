//
//  TimeTableService.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import UIKit
import Alamofire

final class TimeTableService {
    
    func getTimeTableDay(id: String, date: String, owner: String, completion: @escaping(Result<TimeTable,Error>)->Void) {
        
        let id = id.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request("https://\(HostName.host)/api/v2/timetable/day?id=\(id)&date=\(date)&owner=\(owner)").responseData { response in
            
            guard let data = response.data else {return}
            
            do {
                let timetable = try JSONDecoder().decode(TimeTable.self, from: data)
                print("Расписание: \(timetable)")
                completion(.success(timetable))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getTimeTableWeek(id: String, startDate: String, endDate: String, owner: String, completion: @escaping(Result<[TimeTable],Error>)->Void) {
        
        let id = id.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request("https://\(HostName.host)/api/v2/timetable/days?id=\(id)&startDate=\(startDate)&owner=\(owner)&endDate=\(endDate)&removeEmptyDays").responseData { response in
            
            guard let data = response.data else {return}
            
            do {
                let timetable = try JSONDecoder().decode([TimeTable].self, from: data)
                print("Расписание: \(timetable)")
                completion(.success(timetable))
            } catch {
                completion(.failure(error))
            }
        }
    }
    

    func getTimeTableDayImage(json: Data, completion: @escaping(UIImage)->Void) {
        
        let url = "https://\(HostName.host)/api/timetable/image/day?vertical"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        AF.request(request).responseData { response in
            
            guard let data = response.data else {return}
            
            print(response.response?.statusCode)
            
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("нет")
            }
        }
    }
    
    func getTimeTableWeekImage(json: Data, completion: @escaping(UIImage)->Void) {
        
        let url = "https://\(HostName.host)/api/timetable/image/6days?horizontal"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        AF.request(request).responseData { response in
            
            guard let data = response.data else {return}
            
            print(response.response?.statusCode ?? 0)
            
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("нет")
            }
        }
    }
}
