//
//  Buildings.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import MapKit

struct BuildingModel: Identifiable {
    let id: UUID
    let name: String
    let address: String
    let image: [String]
    let type: BuildingType
    let audiences: [String]?
    let pin: CLLocationCoordinate2D
}

struct Buildings {
    
    static let pins = [
        BuildingModel(
            id: UUID(),
            name: "Главный корпус",
            address: "ул. Розы Люксембург, 159, Армавир",
            image: ["главный корпус"],
            type: .building,
            audiences: [
                "1",
                "2",
                "3",
                "4",
                "4а",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                "12",
                "13",
                "14",
                "14а",
                "15",
                "15а",
                "16",
                "17",
                "18",
                "21",
                "22",
                "23",
                "23a",
                "23б",
                "23в"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.001817, longitude: 41.132393)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус и Общежитие №1",
            address: "улица Карла Маркса, 49, Армавир",
            image: ["общежитие 1"],
            type: .buildingAndHostel,
            audiences: [
                "30",
                "31",
                "32",
                "33",
                "34",
                "35",
                "36",
                "37",
                "38",
                "101",
                "102",
                "103",
                "104",
                "105",
                "106",
                "107",
                "108",
                "109",
                "110",
                "111",
                "112",
                "113",
                "114",
                "115",
                "116",
                "117",
                "118",
                "119",
                "120",
                "121"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.000517, longitude: 41.126859)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус №2",
            address: "улица Кирова, 48, Армавир",
            image: [],
            type: .building,
            audiences: [
                "24",
                "25",
                "26",
                "27",
                "28"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.000415, longitude: 41.131333)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус №3 (СПФ)",
            address: "улица Ленина, 79, Армавир",
            image: ["СПФ"],
            type: .building,
            audiences: [
                "40",
                "41",
                "42",
                "43",
                "44",
                "45",
                "46",
                "47",
                "48",
                "49",
                "50"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.002263, longitude: 41.121873)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус №4 (ФТЭиД)",
            address: "Комсомольская улица, 93/1, Армавир",
            image: ["ФТЭиД"],
            type: .building,
            audiences: [
                "51",
                "52",
                "53",
                "57",
                "58а",
                "58б",
                "59",
                "60",
                "61",
                "62",
                "63",
                "64",
                "65",
                "66",
                "67",
                "68"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.003697, longitude: 41.122763)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус №5 (ЕБД)",
            address: "улица Ефремова, 35, Армавир",
            image: [],
            type: .building,
            audiences: [
                "80",
                "81",
                "82",
                "82а",
                "83",
                "84"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.003372, longitude: 41.121388)
        ),
        BuildingModel(
            id: UUID(),
            name: "Корпус №6 (ФОК)",
            address: "улица Полины Осипенко, 83/1, Армавир",
            image: ["ФОК"],
            type: .building,
            audiences: [
                "85",
                "85а",
                "86",
                "86a",
                "Спортзал ФОК"
            ],
            pin: CLLocationCoordinate2D(latitude: 45.006374, longitude: 41.128629)
        ),
        BuildingModel(
            id: UUID(),
            name: "ИСТФАК",
            address: "улица Володарского, 120Б, Армавир",
            image: ["истфак"],
            type: .building,
            audiences: [
                "201",
                "202",
                "203",
                "204",
                "205",
                "206",
                "207",
                "208",
                "209",
                "210"
            ],
            pin: CLLocationCoordinate2D(latitude: 44.989082, longitude: 41.126904)
        ),
        BuildingModel(
            id: UUID(),
            name: "Общежитие №2",
            address: "улица Чернышевского, 3, Армавир",
            image: ["общежитие 2"],
            type: .hostel,
            audiences: nil,
            pin: CLLocationCoordinate2D(latitude: 44.972907, longitude: 41.149784)
        )
    ]
}
