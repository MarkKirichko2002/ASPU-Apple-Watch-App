//
//  AppVersionInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 19.09.2024.
//

import Foundation

final class AppVersionInfoViewModel: ObservableObject {
    
    @Published var info = "Версия: ..."
    
    func getInfo() {
        info = "Версия: \(getAppVersion())"
    }
    
    func getAppVersion()-> String {
        var appVersion = ""
        if let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = currentVersion
        }
        return appVersion
    }
}
