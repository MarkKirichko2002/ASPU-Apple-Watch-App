//
//  MapSettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.10.2024.
//

import SwiftUI

struct MapSettingsListView: View {
    
    @State var showOptions = UserDefaults.standard.object(forKey: "isNavigationBar") as? Bool ?? true
    
    var body: some View {
        List {
            NavigationBarOptionCell(isOn: $showOptions)
            if checkOption() {
                ArrowsColorOptionCell()
            }
        }.navigationTitle("Карты")
        .onChange(of: showOptions) {}
    }
    
    func checkOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isNavigationBar") as? Bool ?? false
    }
}

#Preview {
    MapSettingsListView()
}
