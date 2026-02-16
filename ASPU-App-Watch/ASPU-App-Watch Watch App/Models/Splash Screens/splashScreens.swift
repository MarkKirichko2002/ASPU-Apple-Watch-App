//
//  splashScreenOptions.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.04.2025.
//

import Foundation

enum splashScreenOptions: String, CaseIterable, Codable {
    case regular = "АГПУ"
    case aspu2 = "АГПУ 2-й вариант"
    case technopark = "Технопарк"
    case quantorium = "Кванториум"
    case none = "Без заставки"
    
    var icon: String {
        switch self {
        case .regular:
            return "aspu"
        case .aspu2:
            return "aspu2"
        case .technopark:
            return "technopark"
        case .quantorium:
            return "кванториум"
        case .none:
            return ""
        }
    }
    
    var title: String {
        switch self {
        case .regular:
            return "ФГБОУ ВО «АГПУ»"
        case .aspu2:
            return "ФГБОУ ВО «АГПУ»"
        case .technopark:
            return "Технопарк"
        case .quantorium:
            return "Кванториум"
        case .none:
            return ""
        }
    }
}
