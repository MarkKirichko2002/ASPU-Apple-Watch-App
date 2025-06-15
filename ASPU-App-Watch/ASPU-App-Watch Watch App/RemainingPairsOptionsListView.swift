//
//  RemainingPairsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.12.2024.
//

import SwiftUI

struct RemainingPairsOptionsListView: View {
    
    @State var isOn = UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    
    var body: some View {
        List {
            ShowRemainingPairsCell(isOn: $isOn)
            if checkOption() {
                FuturePaisOptionCell()
            }
            FullPairInfoOptionCell()
        }.navigationTitle("Пары")
        .onChange(of: isOn) {}
    }
    func checkOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    }
}

#Preview {
    RemainingPairsOptionsListView()
}
