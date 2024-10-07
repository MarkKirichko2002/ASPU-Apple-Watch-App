//
//  SwipeOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct SwipeOptionsListView: View {
    
    @State var showOptions = UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    
    var body: some View {
        List {
            SwipeOptionCell(isOn: $showOptions)
            if checkSwipeOption() {
                SwipeFromLeftOptionCell()
                SwipeFromRightOptionCell()
            }
        }.navigationTitle("Свайпы")
        .onChange(of: showOptions) {}
    }
    
    func checkSwipeOption()-> Bool {
        print("чекаем")
        return UserDefaults.standard.object(forKey: "isSwipeOn") as? Bool ?? true
    }
}

//#Preview {
//    SwipeOptionsListView()
//}
