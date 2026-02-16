//
//  NavigationBarOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.10.2024.
//

import SwiftUI

struct NavigationBarOptionCell: View {
    
    @State var isNavigationBar = UserDefaults.standard.object(forKey: "isNavigationBar") as? Bool ?? false
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text("Нижняя панель")
                .foregroundColor(isNavigationBar ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isNavigationBar)
        }.onChange(of: isNavigationBar) { oldValue, newValue in
            isOn.toggle()
            UserDefaults.standard.setValue(newValue, forKey: "isNavigationBar")
        }
    }
}

//#Preview {
//    NavigationBarOptionCell()
//}
