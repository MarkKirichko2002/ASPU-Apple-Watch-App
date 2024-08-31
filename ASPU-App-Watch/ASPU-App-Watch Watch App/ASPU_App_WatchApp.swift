//
//  ASPU_App_WatchApp.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import SwiftUI
import SwiftData

@main
struct ASPU_App_Watch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
        }.modelContainer(for: ArticleModel.self)
    }
}
