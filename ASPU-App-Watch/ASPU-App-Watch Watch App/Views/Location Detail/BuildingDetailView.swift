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
    @State var isSelected = false
    
    var body: some View {
        
        Form() {
            
            Section("Изображение") {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        if !building.image.isEmpty {
                            ForEach(building.image, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .frame(width: 160, height: 160)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                            }.listStyle(.carousel)
                        } else {
                            Text("Нет изображений")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
            }
            
            Section("Название") {
                Text(building.name)
                    .fontWeight(.bold)
            }
            
            Section("Аудитории") {
                if building.audiences?.count ?? 0 > 0 {
                    List(building.audiences ?? [], id: \.self) { audience in
                        Text(audience)
                            .fontWeight(.bold)
                            .onTapGesture {
                                currentAudience = audience
                                isSelected.toggle()
                          }
                    }
                } else {
                    Text("Нет аудиторий")
                        .fontWeight(.bold)
                }
            }
            
            Section("") {
                Button(action: {
                    if let url = URL(string: "http://maps.apple.com/?q=\(building.pin.latitude),\(building.pin.longitude)") {
                        WKExtension.shared().openSystemURL(url)
                    }
                }) {
                    Text("Начать путь")
                        .fontWeight(.bold)
                }
            }
        }
        .navigationTitle("Подробнее")
        .onChange(of: isSelected) {
            self.isPresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: {
            TimetableDayResultListView(id: currentAudience, owner: "CLASSROOM")
        })
    }
}

#Preview {
    BuildingDetailView(building: Buildings.pins[0])
}
