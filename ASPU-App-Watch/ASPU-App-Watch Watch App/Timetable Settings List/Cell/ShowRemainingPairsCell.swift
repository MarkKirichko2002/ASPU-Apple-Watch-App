//
//  ShowRemainingPairsCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 27.09.2024.
//

import SwiftUI

struct ShowRemainingPairsCell: View {
    
    @State var isRemainingPairsOn = UserDefaults.standard.object(forKey: "isRemainingPairsOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Остав. пары")
                .foregroundColor(isRemainingPairsOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isRemainingPairsOn)
        }.onChange(of: isRemainingPairsOn) { oldValue, newValue in
            NotificationCenter.default.post(name: Notification.Name("remaining"), object: nil)
            UserDefaults.standard.setValue(newValue, forKey: "isRemainingPairsOn")
        }
    }
}

#Preview {
    ShowRemainingPairsCell()
}
