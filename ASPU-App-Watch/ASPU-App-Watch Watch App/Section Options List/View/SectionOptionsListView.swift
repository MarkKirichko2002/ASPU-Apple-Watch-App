//
//  SectionOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 15.10.2024.
//

import SwiftUI

struct SectionOptionsListView: View {

    var sections = ["Новости", "Расписание", "Карты", "Настройки"]
    
    @State var selectedSection1 = UserDefaults.standard.string(forKey: "first section") ?? "Новости"
    @State var selectedSection2 = UserDefaults.standard.string(forKey: "second section") ?? "Расписание"
    @State var selectedSection3 = UserDefaults.standard.string(forKey: "third section") ?? "Карты"
    @State var selectedSection4 = UserDefaults.standard.string(forKey: "fourth section") ?? "Настройки"
    
    @State var alert = false
    
    var body: some View {
        List {
            Picker("1-й раздел", selection: $selectedSection1) {
                ForEach(sections, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("2-й раздел", selection: $selectedSection2) {
                ForEach(sections, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("3-й раздел", selection: $selectedSection3) {
                ForEach(sections, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("4-й раздел", selection: $selectedSection4) {
                ForEach(sections, id: \.self) {
                    Text($0)
                }
            }
        }
        .navigationTitle("Разделы")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    let arr = [selectedSection1, selectedSection2, selectedSection3, selectedSection4]
                    checkSections(sections: arr)
                }) {
                    Image("check")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .alert(isPresented: $alert) {
            Alert(title: Text("Измените раздел для позиции"))
        }
    }
    
    func checkSections(sections: [String]) {
        var arr = [String]()
        for section in sections {
            if !arr.contains(section) {
                arr.append(section)
            }
        }
        if arr.count == 4 {
            saveSections(sections: sections)
        } else {
            alert.toggle()
        }
    }
    
    func saveSections(sections: [String]) {
        UserDefaults.standard.set(sections[0], forKey: "first section")
        UserDefaults.standard.set(sections[1], forKey: "second section")
        UserDefaults.standard.set(sections[2], forKey: "third section")
        UserDefaults.standard.set(sections[3], forKey: "fourth section")
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            NotificationCenter.default.post(name: Notification.Name("sections position changed"), object: nil)
        }
    }
}

#Preview {
    SectionOptionsListView()
}
