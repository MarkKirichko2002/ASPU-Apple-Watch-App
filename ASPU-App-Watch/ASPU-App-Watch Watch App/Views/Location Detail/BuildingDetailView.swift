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
    @State var isImagePresented = false
    @State var isPresented = false
    @State var isSelected = false
    @State var isImageSelected = false
    @State var currentImage = ""
    @State var distanceInfo = "Вычисляем растояние..."
    
    let dateManager = DateManager()
    let locationManager = LocationManager()
    
    var body: some View {
        Form() {
            Section("Изображения") {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        if !building.image.isEmpty {
                            ForEach(building.image, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .frame(width: 160, height: 160)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        currentImage = image
                                        isImageSelected.toggle()
                                    }
                            }
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
            
            Section("Адрес") {
                Text(building.address)
                    .fontWeight(.bold)
                    .onTapGesture {
                        if let url = URL(string: "http://maps.apple.com/?q=\(building.pin.latitude),\(building.pin.longitude)") {
                            WKExtension.shared().openSystemURL(url)
                        }
                    }
            }
            
            Section("Расстояние") {
                Text(distanceInfo)
                    .fontWeight(.bold)
            }
            
            Section("Аудитории") {
                if building.audiences.count > 0 {
                    List(building.audiences, id: \.self) { audience in
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
        .onAppear {
            getLocation()
        }
        .onDisappear {
            locationManager.manager.stopUpdatingLocation()
        }
        .onChange(of: isSelected) {
            self.isPresented.toggle()
        }
        .onChange(of: isImageSelected) {
            self.isImagePresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: {
            TimetableDayResultListView(id: currentAudience, date: dateManager.getCurrentDate(), owner: "CLASSROOM")
        })
        .sheet(isPresented: $isImagePresented, content: {
            ZoomImageView(url: currentImage)
        })
    }
    
    func getLocation() {
        
        locationManager.isUpdates = true
        locationManager.getLocations()
        
        locationManager.registerLocationHandler { location in
            print(location.coordinate)
            self.distanceInfo = self.getInfo(currentLocation: location, for: self.building)
        }
    }
    
    func getInfo(currentLocation: CLLocation, for building: BuildingModel)-> String {
        let locationA = CLLocation(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let locationB = CLLocation(latitude: building.pin.latitude, longitude:  building.pin.longitude)
        let distance = locationA.distance(from: locationB)
        let kilometers = Int(distance) / 1000
        let metres = Int(distance.truncatingRemainder(dividingBy: 1000))
        
        if (kilometers == 0 && metres <= 100) {
            return "В корпусе"
        } else {
            return "До корпуса осталось: \(kilometers) км \(metres) м"
        }
    }
}

#Preview {
    BuildingDetailView(building: Buildings.pins[0])
}
