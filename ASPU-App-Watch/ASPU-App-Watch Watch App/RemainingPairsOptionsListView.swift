//
//  PairsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.12.2024.
//

import SwiftUI

struct PairsOptionsListView: View {
    
    @State var isOn = UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    
    var body: some View {
        List {
            ShowRemainingPairsCell(isOn: $isOn)
            if checkOption() {
                FuturePaisOptionCell()
            }
            FullPairInfoOptionCell()
            ShowCurrentPairInfoOptionCell()
        }.navigationTitle("Пары")
        .onChange(of: isOn) {}
    }
    func checkOption()-> Bool {
        return UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    }
}

#Preview {
    PairsOptionsListView()
}
