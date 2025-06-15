//
//  ArrowColorOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.10.2024.
//

import SwiftUI

struct ArrowColorOptionsListView: View {
    
    @State var currentColor = AppColors.system
    @Binding var isChanged: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        List(AppColors.allCases, id: \.self) { color in
            if currentColor == color {
                HStack {
                    Text(color.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(color.color))
                    Spacer()
                    Image("check")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color(color.color))
                }
            } else {
                HStack {
                    Text(color.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(color.color))
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentColor = color
                    saveColor(color: color) {
                        isChanged.toggle()
                        closeScreen()
                    }
                }
            }
        }.navigationTitle("Цвета")
            .onAppear {
                currentColor = settingsManager.getArrowsColor()
            }
            .fontWeight(.bold)
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveColor(color: AppColors, completion: @escaping()->Void) {
        UserDefaults.saveData(object: color, key: "arrow color") {completion()}
    }
}

//#Preview {
//    ArrowColorOptionsListView()
//}
