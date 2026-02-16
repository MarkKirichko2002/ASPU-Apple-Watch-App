//
//  SwipeOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct SwipeOptionsListView: View {
    
    @State var isOn = UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    
    var body: some View {
        List {
            SwipeOptionCell(isOn: $isOn)
            if checkOption() {
                SwipeEdgeOptionCell()
            }
        }.navigationTitle("Свайпы")
        .onChange(of: isOn) {}
    }
    
    func checkOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    }
}

//#Preview {
//    SwipeOptionsListView()
//}
