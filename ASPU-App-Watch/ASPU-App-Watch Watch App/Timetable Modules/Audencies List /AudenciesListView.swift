//
//  AudenciesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.07.2024.
//

import SwiftUI

struct AudenciesListView: View {
    
    var building: BuildingModel
    @State var currentAudience = ""
    @State var isPresented = false
    
    var body: some View {
        
        VStack {
            if building.audiences?.count ?? 0 > 0 {
                List(building.audiences ?? [], id: \.self) { audience in
                    Text("аудитория: \(audience)")
                        .onTapGesture {
                            currentAudience = audience
                            isPresented.toggle()
                     }
                }
            } else {
                Text("Нет аудиторий")
            }
        }.navigationTitle(building.name)
            .sheet(isPresented: $isPresented, content: {
                TimetableDayResultListView(id: currentAudience, owner: "CLASSROOM")
        })
    }
}

#Preview {
    AudenciesListView(building: Buildings.pins[0])
}
