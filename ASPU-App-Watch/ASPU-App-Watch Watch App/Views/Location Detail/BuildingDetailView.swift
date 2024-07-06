//
//  BuildingDetailView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct BuildingDetailView: View {
    
    var building: BuildingModel
    
    var body: some View {
        
        Form() {
            
            Section("название") {
                Text(building.name)
            }
            
            Section("аудитории") {
                if building.audiences?.count ?? 0 > 0 {
                    List(building.audiences ?? [], id: \.self) { audience in
                        Text(audience)
                    }
                } else {
                    Text("нет аудиторий")
                }
            }
            
            Section("") {
                Button(action: {
                    if let url = URL(string: "http://maps.apple.com/?q=\(building.pin.latitude),\(building.pin.longitude)") {
                        WKExtension.shared().openSystemURL(url)
                    }
                }) {
                    Text("начать путь")
                }
            }
        }.navigationTitle("Подробнее")
    }
}

#Preview {
    BuildingDetailView(building: Buildings.pins[0])
}
