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
    @State var currentAudience = ""
    @State var isPresented = false
    
    var body: some View {
        
        Form() {
            
            Section("Название") {
                Text(building.name)
            }
            
            Section("Аудитории") {
                if building.audiences?.count ?? 0 > 0 {
                    List(building.audiences ?? [], id: \.self) { audience in
                        Text(audience)
                            .onTapGesture {
                                currentAudience = audience
                                isPresented.toggle()
                          }
                    }
                } else {
                    Text("Нет аудиторий")
                }
            }
            
            Section("") {
                Button(action: {
                    if let url = URL(string: "http://maps.apple.com/?q=\(building.pin.latitude),\(building.pin.longitude)") {
                        WKExtension.shared().openSystemURL(url)
                    }
                }) {
                    Text("Начать путь")
                }
            }
        }.navigationTitle("Подробнее")
            .sheet(isPresented: $isPresented, content: {
                TimetableDayResultListView(id: currentAudience, owner: "CLASSROOM")
        })
    }
}

#Preview {
    BuildingDetailView(building: Buildings.pins[0])
}
