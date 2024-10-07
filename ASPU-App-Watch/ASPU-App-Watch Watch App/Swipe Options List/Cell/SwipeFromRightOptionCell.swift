//
//  SwipeFromRightOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 28.09.2024.
//

import SwiftUI

struct SwipeFromRightOptionCell: View {
    
    @State var currentAction = UserDefaults.loadData(type: SwipeActions.self, key: "swipe from right") ?? SwipeActions.up
    
    var body: some View {
        Picker("Свайп вправо", selection: $currentAction) {
            ForEach(SwipeActions.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }.onChange(of: currentAction) { style in
            UserDefaults.saveData(object: style, key: "swipe from right") {}
        }
    }
}
#Preview {
    SwipeFromRightOptionCell()
}
