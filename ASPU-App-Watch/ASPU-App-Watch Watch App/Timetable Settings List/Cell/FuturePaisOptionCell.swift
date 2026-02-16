//
//  FuturePaisOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.12.2024.
//

import SwiftUI

struct FuturePaisOptionCell: View {
    
    @State var isNextDayOn = UserDefaults.standard.object(forKey: "isNextDayOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Будущие пары")
                .foregroundColor(isNextDayOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isNextDayOn)
        }.onChange(of: isNextDayOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isNextDayOn")
        }
    }
}

#Preview {
    FuturePaisOptionCell()
}
