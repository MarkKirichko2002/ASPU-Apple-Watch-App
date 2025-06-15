//
//  ShowRemainingWeeksCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.12.2024.
//

import SwiftUI

struct ShowRemainingWeeksCell: View {
    
    @State var isRemainingWeeksOn = UserDefaults.standard.object(forKey: "isRemainingWeeksOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Остав. недели")
                .foregroundColor(isRemainingWeeksOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isRemainingWeeksOn)
        }.onChange(of: isRemainingWeeksOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isRemainingWeeksOn")
        }
    }
}

#Preview {
    ShowRemainingWeeksCell()
}
