//
//  AppSections.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import Foundation

struct AppSections {
    
    static let sections = [
        AppSectionModel(id: 1, isVisible: true, name: "Новости", icon: "mail"),
        AppSectionModel(id: 2, isVisible: true, name: "Расписание", icon: "clock"),
        AppSectionModel(id: 3, isVisible: true, name: "Карты", icon: "map"),
        AppSectionModel(id: 4, isVisible: true, name: "Настройки", icon: "settings")
    ]
}
