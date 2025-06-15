//
//  CellStyleOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.10.2024.
//

import SwiftUI

struct CellStyleOptionsListView: View {
    
    @State var currentStyle = CellStyle.automatic
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        List(CellStyle.allCases, id: \.self) { style in
            if currentStyle == style {
                HStack {
                    Text(style.rawValue)
                        .fontWeight(.bold)
                    Spacer()
                    Image("check")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            } else {
                HStack {
                    Text(style.rawValue)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentStyle = style
                    saveStyle(style: style) {
                        closeScreen()
                    }
                }
            }
        }.navigationTitle("Стили списка")
            .onAppear {
                currentStyle = settingsManager.getSavedListStyle()
            }
            .fontWeight(.bold)
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveStyle(style: CellStyle, completion: @escaping()->Void) {
        UserDefaults.saveData(object: style, key: "list style") {completion()}
    }
}

#Preview {
    CellStyleOptionsListView()
}
