//
//  SwipeOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct SwipeOptionCell: View {
    
    @State var isSwipeOn = UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text("Жесты")
                .foregroundColor(isSwipeOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isSwipeOn)
        }.onChange(of: isSwipeOn) { oldValue, newValue in
            isOn.toggle()
            UserDefaults.standard.setValue(newValue, forKey: "isSwipeOn")
        }
    }
}

//#Preview {
//    SwipeOptionCell()
//}
