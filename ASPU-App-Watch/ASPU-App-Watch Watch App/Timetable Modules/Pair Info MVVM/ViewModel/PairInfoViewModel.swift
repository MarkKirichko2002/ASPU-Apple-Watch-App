//
//  PairInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.08.2024.
//

import CoreLocation

final class PairInfoViewModel: ObservableObject {
    
    @Published var pairInfo = [String]()
    @Published var isAlert = false
    
    var pair: Discipline = Discipline(id: "", time: "8:00-9:30", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    var date: String = ""
    
    var timer: Timer?
    
    // MARK: - Init
    init(pair: Discipline, date: String) {
        self.pair = pair
        self.date = date
    }
    
    // MARK: - сервисы
    let dateManager = DateManager()
    let locationManager = LocationManager()
    let settingsManager = SettingsManager()
    
    func checkSettings() {
        if settingsManager.getFullPairInfoOption() {
            setUpData()
        } else {
            setUpShortData()
        }
    }
    
    func stopUpdateInfo() {
        if settingsManager.getFullPairInfoOption() {
            stopTimer()
            stopUpdatingLocation()
        }
    }
    
    func setUpData() {
        let startTime = getStartTime()
        let endTime = getEndTime()
        let pairType = pair.type.title
        let subGroup = checkSubGroup(subgroup: pair.subgroup)
        pairInfo.append("Дата: \(date)")
        pairInfo.append("Дисциплина: \(pair.name)")
        pairInfo.append("Начало: \(startTime)")
        pairInfo.append("Конец: \(endTime)")
        pairInfo.append("Преподаватель: \(pair.teacherName)")
        pairInfo.append("Группа: \(pair.groupName)")
        pairInfo.append(subGroup)
        pairInfo.append("Тип пары: \(pairType)")
        pairInfo.append("Аудитория: \(pair.audienceID)")
        pairInfo.append("Вычисляем время...")
        pairInfo.append("Вычисляем растояние...")
        checkCurrentTime()
        checkLocationAuthorizationStatus()
    }
    
    func setUpShortData() {
        let startTime = getStartTime()
        let endTime = getEndTime()
        let pairType = pair.type.title
        let subGroup = checkSubGroup(subgroup: pair.subgroup)
        pairInfo.append("Дата: \(date)")
        pairInfo.append("Дисциплина: \(pair.name)")
        pairInfo.append("Начало: \(startTime)")
        pairInfo.append("Конец: \(endTime)")
        pairInfo.append("Преподаватель: \(pair.teacherName)")
        pairInfo.append("Группа: \(pair.groupName)")
        pairInfo.append(subGroup)
        pairInfo.append("Тип пары: \(pairType)")
        pairInfo.append("Аудитория: \(pair.audienceID)")
    }
    
    func getStartTime()-> String {
        let times = pair.time.components(separatedBy: "-")
        let startTime = times[0] + ":00"
        return startTime
    }
    
    func getEndTime()-> String {
        let times = pair.time.components(separatedBy: "-")
        let endTime = times[1] + ":00"
        return endTime
    }
    
    func checkSubGroup(subgroup: Int)-> String {
        if subgroup == 0 && !pair.name.contains("Дисциплина по выбору") &&
            pair.type != .exam {
            return "Подгруппа: общая пара"
        } else if pair.name.contains("Дисциплина по выбору") {
            return "Подгруппа: отсутствует"
        } else if pair.type == .exam {
            return "Какая подгруппа? Это экзамен!"
        } else {
            return "Подгруппа: \(subgroup)"
        }
    }
    
    func startTimer() {
        print("timer fired")
        timer?.fire()
    }
    
    func stopTimer() {
        print("timer stopped")
        timer?.invalidate()
    }
    
    func checkCurrentTime() {
        // текущая дата
        let currentDate = dateManager.getCurrentDate()
        // начало пары
        let startTime = getStartTime()
        // конец пары
        let endTime = getEndTime()
        // текущее время
        let currentTime = dateManager.getCurrentTime(isFullFormat: true)
        // сравнение двух дат
        let dateComparisonResult = dateManager.compareDates(date1: currentDate, date2: date)
        // сравнение текущего времени и времени начала пары
        let timeComparisonResult = dateManager.compareTimes(time1: currentTime, time2: startTime)
        // сравнение текущего времени и времени окончания пары
        let timeComparisonResult2 = dateManager.compareTimes(time1: currentTime, time2: endTime)
        
        // если даты равны и текущее время меньше времени начала пары
        if dateComparisonResult == .orderedSame && timeComparisonResult == .orderedAscending {
            getTimeLeftToStart()
        }
        
        // если даты равны и текущее время меньше времени окончания пары
        else if dateComparisonResult == .orderedSame && timeComparisonResult2 == .orderedAscending {
            getTimeLeftToEnd()
        }
        
        // если даты равны и текущее время больше времени окончания пары
        else if dateComparisonResult == .orderedSame && timeComparisonResult2 == .orderedDescending {
            getTimeEnded()
        }
        
        // если текущая дата меньше другой
        else if dateComparisonResult == .orderedAscending {
            getTimeLeftToStartInFuture()
        }
        
        // если текущая дата больше другой
        else if dateComparisonResult == .orderedDescending {
            getTimeEnded()
        } else {
            getTimeLeftToStart()
        }
    }
    
    // время до начала пары
    func getTimeLeftToStart() {
        
        let calendar = Calendar.current
        
        let times = getStartTime().components(separatedBy: ":")
        
        let startHour = times[0]
        let endHour = times[1]
        
        var components = DateComponents()
        components.hour = Int(startHour)
        components.minute = Int(endHour)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            let currentDate = Date()
            
            if let startDate = calendar.date(bySettingHour: components.hour!, minute: components.minute!, second: 0, of: currentDate) {
                
                let difference = calendar.dateComponents([.hour, .minute, .second], from: currentDate, to: startDate)
                
                if let hours = difference.hour, let minutes = difference.minute, let seconds = difference.second {
                    if hours <= 0 && minutes <= 0 && seconds <= 0 {
                        self.stopTimer()
                        self.getTimeLeftToEnd()
                    } else {
                        self.pairInfo[9] = "До начала: \(hours) часов \(minutes) минут \(seconds) секунд"
                    }
                } else {
                    print("Ошибка")
                }
            } else {
                print("Ошибка при установке времени начала пары")
            }
        }
    }
    
    // время до конца пары
    func getTimeLeftToEnd() {
        
        let calendar = Calendar.current
        
        let times = getEndTime().components(separatedBy: ":")
        
        let startHour = times[0]
        let endHour = times[1]
        
        var components = DateComponents()
        components.hour = Int(startHour)
        components.minute = Int(endHour)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            let currentDate = Date()
            
            if let startDate = calendar.date(bySettingHour: components.hour!, minute: components.minute!, second: 0, of: currentDate) {
                
                let difference = calendar.dateComponents([.hour, .minute, .second], from: currentDate, to: startDate)
                
                if let hours = difference.hour, let minutes = difference.minute, let seconds = difference.second {
                    
                    if hours >= 0 && minutes >= 0 && seconds >= 0 {
                        self.pairInfo[9] = "До конца пары: \(hours) часов \(minutes) минут \(seconds) секунд"
                    } else if hours <= 0 && minutes <= 0 && seconds <= 0 {
                        self.pairInfo[9] = "Пара закончилась"
                        self.stopTimer()
                        self.getTimeEnded()
                    }
                } else {
                    print("Ошибка")
                }
            } else {
                print("Ошибка при установке времени начала пары")
            }
        }
    }
    
    // время до начала пары в будущем
    func getTimeLeftToStartInFuture() {
        
        let calendar = Calendar.current
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            let times = self.dateManager.getCurrentTime(isFullFormat: true)
            
            let startTimes = self.getStartTime().components(separatedBy: ":")
            let startHour = startTimes[0]
            let endHour = startTimes[1]
            
            let dates = self.date.components(separatedBy: ".")
            var components = DateComponents()
            components.day = Int(dates[0])
            components.month = Int(dates[1])
            components.year = Int(dates[2])
            
            let currentDate = self.dateManager.getCurrentDate() + " \(times)"
            let startDate = calendar.date(from: components)!
            let startDateString = self.dateManager.getFormattedDate(date: startDate) + " \(startHour):\(endHour):00"
            
            print(currentDate)
            print(startDateString)
            
            let info = self.dateManager.getInfoFromDates(date: currentDate, date2: startDateString)
            
            self.pairInfo[9] = "Осталось: \(abs(info.day ?? 0)) дней \(abs(info.hour ?? 0)) часов \(abs(info.minute ?? 0)) минут \(abs(info.second ?? 0)) секунд"
        }
    }
    
    // время после окончания пары
    func getTimeEnded() {
        
        let calendar = Calendar.current
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            let times = self.dateManager.getCurrentTime(isFullFormat: true)
            
            let startTimes = self.getEndTime().components(separatedBy: ":")
            let startHour = startTimes[0]
            let endHour = startTimes[1]
            
            let dates = self.date.components(separatedBy: ".")
            var components = DateComponents()
            components.day = Int(dates[0])
            components.month = Int(dates[1])
            components.year = Int(dates[2])
            
            let currentDate = self.dateManager.getCurrentDate() + " \(times)"
            let startDate = calendar.date(from: components)!
            let startDateString = self.dateManager.getFormattedDate(date: startDate) + " \(startHour):\(endHour):00"
            
            print(currentDate)
            print(startDateString)
            
            let info = self.dateManager.getInfoFromDates(date: currentDate, date2: startDateString)
            
            self.pairInfo[9] = "Прошло с окончания: \(abs(info.day ?? 0)) дней \(abs(info.hour ?? 0)) часов \(abs(info.minute ?? 0)) минут \(abs(info.second ?? 0)) секунд"
        }
    }
    
    func checkLocationAuthorizationStatus() {
        locationManager.checkLocationAuthorization { isAuthorized in
            if isAuthorized {
                self.getLocation()
            } else {
                DispatchQueue.main.async {
                    self.isAlert.toggle()
                }
            }
        }
    }
    
    func getLocation() {
        
        locationManager.isUpdates = true
        locationManager.getLocations()
        
        locationManager.registerLocationHandler { location in
            let currentBuilding = self.currentBuilding()
            self.pairInfo[10] = self.getInfo(currentLocation: location, for: currentBuilding)
        }
    }
    
    func getInfo(currentLocation: CLLocation, for building: BuildingModel)-> String {
        let locationA = CLLocation(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let locationB = CLLocation(latitude: building.pin.latitude, longitude:  building.pin.longitude)
        let distance = locationA.distance(from: locationB)
        let kilometers = Int(distance) / 1000
        let metres = Int(distance.truncatingRemainder(dividingBy: 1000))
        
        if metres <= 100 {
            return "В корпусе"
        } else {
            return "До корпуса \"\(building.name)\" осталось: \(kilometers) км \(metres) м"
        }
    }
    
    func currentBuilding()-> BuildingModel {
        for building in Buildings.pins {
            for audience in building.audiences {
                if audience == pair.audienceID {
                    return building
                }
            }
        }
        return Buildings.pins[0]
    }
    
    func stopUpdatingLocation() {
        locationManager.manager.stopUpdatingLocation()
    }
}
