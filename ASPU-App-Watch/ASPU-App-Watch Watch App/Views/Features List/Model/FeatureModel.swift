//
//  FeatureModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 14.09.2024.
//

import Foundation

struct FeatureModel: Identifiable {
    let id: Int
    let name: String
    let otherName: String
    let description: String
}

struct AppFeatures {
    static let features = [
        FeatureModel(
            id: 1,
            name: "Adaptive News",
            otherName: "адаптивные новости",
            description: "просмотр последних новостей и объявлений университета, фильтрация, а также сохранение в избранное. Когда вы выбираете категорию она сохраняется и новости будут адаптироваться в зависимости от нее."
        ),
        FeatureModel(
            id: 2,
            name: "Innovative Timetable",
            otherName: "инновационное расписание",
            description: "просмотр расписания занятий, фильтрация пар, возможность узнавать время до начала и окончания пары, где будет проходить пара."
        ),
        FeatureModel(
            id: 3,
            name: "Find Campus",
            otherName: "найти кампус",
            description: "получайте информацию о выбранном месте. Совершайте быструю навигацию между метками зданий с помощью навигационной панели. Также вы можете посмотреть расписание для аудиторий данного корпуса на сегодняшний день."
        ),
        FeatureModel(
            id: 4,
            name: "Swipe Actions",
            otherName: "действия по свайпу",
            description: "с помощью свайпа влево можно получить информацию: количество пар на сегодня, какие новости появились за сегодня, список всех корпусов, текущая версия приложения, количество пар на сегодня для конкретной аудитории корпуса, количество дней для конкретной недели."
        )
    ]
}
