//
//  SwipeFromLeftOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 28.09.2024.
//

import SwiftUI

struct SwipeFromLeftOptionCell: View {
    
    @State var currentAction = UserDefaults.loadData(type: SwipeActions.self, key: "swipe from left") ?? SwipeActions.info
    
    var body: some View {
        Picker("Свайп влево", selection: $currentAction) {
            ForEach(SwipeActions.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }.onChange(of: currentAction) { style in
            UserDefaults.saveData(object: style, key: "swipe from left") {}
        }
    }
}
#Preview {
    SwipeFromLeftOptionCell()
}
