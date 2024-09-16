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
            description: "Просмотр последних новостей и объявлений университета, а также их сохранение в избранное. Когда вы выбираете категорию она сохраняется и новости будут адаптироваться в зависимости от нее. В дополнение можно выбрать категорию новостей в настройках."
        ),
        FeatureModel(
            id: 2,
            name: "Innovative Timetable",
            otherName: "инновационное расписание",
            description: "Просмотр расписания занятий, фильтрация пар, возможность узнавать время до начала/конца пары, расстояние до корпуса, где будет пара."
        ),
        FeatureModel(
            id: 3,
            name: "Find Campus",
            otherName: "найти кампус",
            description: "Навигация по карте кампуса с указанием расположения корпусов, а также их фильтрация."
        ),
        FeatureModel(
            id: 4,
            name: "Fast Info",
            otherName: "быстрая информация",
            description: "С помощью свайпа можно получить информацию для раздела \"Новости\", \"Расписание\" или \"Карты\". Например, количество пар, какие новости появились за сегодня или получить информацию о ближайшем корпусе."
        )
    ]
}
