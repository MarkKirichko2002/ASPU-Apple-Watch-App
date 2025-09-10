//
//  GroupByDatesOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct GroupByDatesOptionCell: View {
    
    @State var isGroupByDatesOn = UserDefaults.standard.object(forKey: "isGroupByDatesOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Группировка по дате")
                .foregroundColor(isGroupByDatesOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isGroupByDatesOn)
        }.onChange(of: isGroupByDatesOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isGroupByDatesOn")
        }
    }
}

#Preview {
    GroupByDatesOptionCell()
}
